import mysql.connector

connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='yourpassword',
    database='LittleLemon'
)

cursor = connection.cursor()

def GetMaxQuantity():
    cursor.execute("SELECT MAX(Quantity) FROM Orders;")
    print("Max Quantity:", cursor.fetchone()[0])

def AddBooking(customer_id, booking_date, guests, table_no, status):
    query = "INSERT INTO Bookings (CustomerID, BookingDate, NumberOfGuests, TableNumber, Status) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(query, (customer_id, booking_date, guests, table_no, status))
    connection.commit()
    print("Booking added.")

cursor.close()
connection.close()
