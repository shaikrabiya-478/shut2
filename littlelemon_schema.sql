-- Little Lemon Booking System Schema

CREATE DATABASE IF NOT EXISTS LittleLemon;
USE LittleLemon;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookingDate DATE,
    NumberOfGuests INT,
    TableNumber INT,
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Menu (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100),
    Price DECIMAL(10,2),
    Category VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    MenuID INT,
    Quantity INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);
