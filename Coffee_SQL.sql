-- Created the Database first

DROP DATABASE IF EXISTS coffee_sales;
CREATE DATABASE coffee_sales;
USE coffee_sales;

-- After creating the database, we generated the three tables (Customers, Orders and Products)

CREATE TABLE Customers (
    CustomerID VARCHAR(30) PRIMARY KEY NOT NULL,
    CustomerName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) DEFAULT NULL,
    PhoneNumber VARCHAR(20) DEFAULT NULL,
    AddressLine VARCHAR(255) DEFAULT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    Postcode VARCHAR(100) DEFAULT NULL,
    LoyaltyCard VARCHAR(10) NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
 
CREATE table products (
			ProductID VARCHAR(10) PRIMARY KEY NOT NULL,
            CoffeeType VARCHAR(10) NOT NULL,
            RoastType VARCHAR(5) NOT NULL,
            Size DECIMAL(4,2) NOT NULL,
            Unit_Price FLOAT(10,4) NOT NULL,
            PricePer100g FLOAT(10,4) NOT NULL,
            Profit FLOAT(10,5) NOT NULL
)ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE orders (
	OrderNo VARCHAR(10) Primary Key not null,
    OrderID VARCHAR(30) NOT NULL,
    OrderDate DATE NOT NULL,
    CustomerID VARCHAR(30) NOT NULL,
    ProductID VARCHAR(30) NOT NULL,
    Quantity INT NOT NULL,
	INDEX idx_OrderID (OrderID)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- DATA IMPORT TABLE FROM EXCEL
								
                                -- FEATURE ENGINEERING
-- After importation, various feature engineering procedures to generate new columns that will aid in analysis
-- For instance introducing a new column (day_name)
alter table orders
	add column day_name varchar (20);
    
-- Populating the newly introduced day column
UPDATE orders 
SET 
    day_name = DAYNAME(OrderDate);

-- Introducing a new column (Month_name)
alter table orders
add column month_name varchar (20);

-- Populating the newly introduced month column
UPDATE orders 
SET 
    month_name = MONTHNAME(OrderDate);
    
-- Now to answer the analytical questions using Excel, we will retrieve the tables as a unit and export them to an excel file for further analysis
SELECT 
    *
FROM
    customers
        JOIN
    orders o ON customers.CustomerID = o.CustomerID
        JOIN
    products p ON o.ProductID = p.ProductID;

-- THE END















