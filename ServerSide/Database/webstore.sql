DROP DATABASE IF EXISTS WebstoreDB;
CREATE DATABASE WebstoreDB;
USE WebstoreDB;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Procdure to create the all of the tables in the database
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP PROCEDURE IF EXISTS makeWebstoreDB;
DELIMITER //
CREATE PROCEDURE makeWebstoreDB()
	BEGIN 
    CREATE TABLE `Productline` (
      `ID`              int(10) NOT NULL AUTO_INCREMENT, 
      `ProductLineName` char(255), 
      `Description`     varchar(255), 
      `Image`           varchar(100), 
      PRIMARY KEY (ID));
    CREATE TABLE `Product` (
      `ID`               int(10) NOT NULL AUTO_INCREMENT, 
      `ProductlineID`    int(10) NOT NULL, 
      `LastModifiedBy`   int(10) NOT NULL, 
      `Name`             varchar(255), 
      `Manufacturer`     varchar(255), 
      `PdtDescription`   varchar(255), 
      `QtyInStock`       int(10), 
      `BuyPrice`         decimal(13, 2), 
      `MSRP`             varchar(255), 
      `Image`            varchar(100), 
      `LastModifiedDate` date NOT NULL, 
      `IsAvailable`      tinyint(1) NOT NULL, 
      PRIMARY KEY (ID));
    CREATE TABLE `Order` (
      `ID`             int(10) NOT NULL AUTO_INCREMENT, 
      `CustomerID`     int(10) NOT NULL, 
      `PaymentID`      int(10), 
      `Status`         varchar(255) NOT NULL, 
      `OrderDate`      date, 
      `ShippedDate`    date, 
      `Comments`       varchar(255), 
      `TrackingNumber` varchar(255), 
      `IsDeleted`      tinyint(1) NOT NULL, 
      PRIMARY KEY (ID));
    CREATE TABLE `Payment` (
      `ID`          int(10) NOT NULL AUTO_INCREMENT, 
      `CustomerID`  int(10) NOT NULL, 
      `PaymentDate` date, 
      `Amount`      decimal(13, 2), 
      PRIMARY KEY (ID));
    CREATE TABLE Customer (
      `ID`       int(10) NOT NULL AUTO_INCREMENT, 
      `PersonID` int(10) NOT NULL, 
      PRIMARY KEY (ID));
    CREATE TABLE Order_Product (
      `OrderID`   int(10) NOT NULL, 
      `ProductID` int(10) NOT NULL, 
      `Qty`       int(10) NOT NULL, 
      `PriceEach` decimal(13, 2) NOT NULL, 
      PRIMARY KEY (OrderID, 
      ProductID));
    CREATE TABLE Employee (
      `ID`       int(10) NOT NULL AUTO_INCREMENT, 
      `PersonID` int(10) NOT NULL, 
      `Role`     char(10), 
      PRIMARY KEY (ID));
    CREATE TABLE Person (
      `ID`        int(10) NOT NULL AUTO_INCREMENT, 
      `FirstName` varchar(255) NOT NULL, 
      `LastName`  varchar(255) NOT NULL, 
      `Email`     char(100) NOT NULL, 
      `Phone`     varchar(255), 
      `Address`   varchar(255), 
      `City`      varchar(255), 
      `PostCode`  int(4), 
      PRIMARY KEY (ID));
    ALTER TABLE `Payment` ADD CONSTRAINT FKPayment75777 FOREIGN KEY (`CustomerID`) REFERENCES Customer (`ID`);
    ALTER TABLE `Order` ADD CONSTRAINT FKOrder556711 FOREIGN KEY (`CustomerID`) REFERENCES Customer (`ID`);
    ALTER TABLE `Order_Product` ADD CONSTRAINT FKOrder_Prod922282 FOREIGN KEY (`OrderID`) REFERENCES `Order` (`ID`);
    ALTER TABLE `Order_Product` ADD CONSTRAINT FKOrder_Prod600571 FOREIGN KEY (`ProductID`) REFERENCES Product (`ID`);
    ALTER TABLE `Product` ADD CONSTRAINT FKProduct65612 FOREIGN KEY (`ProductlineID`) REFERENCES Productline (`ID`);
    ALTER TABLE `Customer` ADD CONSTRAINT FKCustomer220859 FOREIGN KEY (`PersonID`) REFERENCES Person (`ID`);
    ALTER TABLE `Employee` ADD CONSTRAINT FKEmployee925855 FOREIGN KEY (`PersonID`) REFERENCES Person (`ID`);
    ALTER TABLE `Product` ADD CONSTRAINT FKProduct450223 FOREIGN KEY (`LastModifiedBy`) REFERENCES Employee (`ID`);
    ALTER TABLE `Order` ADD CONSTRAINT FKOrder92191 FOREIGN KEY (`PaymentID`) REFERENCES Payment (`ID`);	

  END//
DELIMITER ;
CALL makeWebstoreDB();

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- INSERT Test Data
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~~~
-- Productline Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~
-- Person Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~
-- Employee Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~
-- Customer Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~
-- Payment Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~
-- Product Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~
-- Order Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~
-- Order_Product Test Data
-- ~~~~~~~~~~~~~~~~~~~



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- SELECT Statements
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM Productline;
SELECT * FROM Person;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Payment;
SELECT * FROM Product;
SELECT * FROM Order;
SELECT * FROM Order_Product;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- DELETE Statements
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- DELETE * FROM Order_Product
-- DELETE * FROM Order;
-- DELETE * FROM Product;
-- DELETE * FROM Payment;
-- DELETE * FROM Customer;
-- DELETE * FROM Employee;
-- DELETE * FROM Person;
-- DELETE * FROM Productline;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Procedures
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
