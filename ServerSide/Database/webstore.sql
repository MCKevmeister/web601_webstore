DROP DATABASE IF EXISTS WebstoreDB;
CREATE DATABASE WebstoreDB;
USE WebstoreDB;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Procedure to create the all of the tables in the database
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP PROCEDURE IF EXISTS makeWebstoreDB;
DELIMITER //
CREATE PROCEDURE makeWebstoreDB()
	BEGIN
    CREATE TABLE `Category` (
      `ID`              int NOT NULL AUTO_INCREMENT,
      `CategoryName` char(255),
      `Description`     varchar(255),
      `Image`           varchar(100),
      PRIMARY KEY (ID));
    CREATE TABLE `Product` (
      `ID`               int NOT NULL AUTO_INCREMENT,
      `CategoryID`       int NOT NULL,
      `LastModifiedBy`   int NOT NULL,
      `Name`             varchar(255),
      `Manufacturer`     varchar(255),
      `Description`      varchar(255),
      `QtyInStock`       int,
      `Price`            decimal(13, 2),
      `MSRP`             varchar(255),
      `Image`            varchar(100),
      `LastModifiedDate` date NOT NULL,
      `IsAvailable`      tinyint(1) NOT NULL,
      PRIMARY KEY (ID));
    CREATE TABLE `Order` (
      `ID`             int NOT NULL AUTO_INCREMENT,
      `CustomerID`     int NOT NULL,
      `PaymentID`      int,
      `Status`         varchar(255) NOT NULL,
      `OrderDate`      date,
      `ShippedDate`    date,
      `Comments`       varchar(255),
      `TrackingNumber` varchar(255),
      `IsDeleted`      tinyint(1) NOT NULL,
      PRIMARY KEY (ID));
    CREATE TABLE `Payment` (
      `ID`          int NOT NULL AUTO_INCREMENT,
      `CustomerID`  int NOT NULL,
      `PaymentDate` date,
      `Amount`      decimal(13, 2),
      PRIMARY KEY (ID));
    CREATE TABLE Customer (
      `ID`       int NOT NULL AUTO_INCREMENT,
      `PersonID` int NOT NULL,
      PRIMARY KEY (ID));
    CREATE TABLE Order_Product (
      `OrderID`   int NOT NULL,
      `ProductID` int NOT NULL,
      `Qty`       int NOT NULL,
      `PriceEach` decimal(13, 2) NOT NULL,
      PRIMARY KEY (OrderID,
      ProductID));
    CREATE TABLE Employee (
      `ID`       int NOT NULL AUTO_INCREMENT,
      `PersonID` int NOT NULL,
      `Role`     char(255),
      PRIMARY KEY (ID));
    CREATE TABLE Person (
      `ID`        int NOT NULL AUTO_INCREMENT,
      `FirstName` varchar(255) NOT NULL,
      `LastName`  varchar(255) NOT NULL,
      `Email`     char(100) NOT NULL,
      `Phone`     varchar(255),
      `Address`   varchar(255),
      `City`      varchar(255),
      `PostCode`  int,
      PRIMARY KEY (ID));
    ALTER TABLE `Payment` ADD CONSTRAINT FKPayment75777 FOREIGN KEY (`CustomerID`) REFERENCES Customer (`ID`);
    ALTER TABLE `Order` ADD CONSTRAINT FKOrder556711 FOREIGN KEY (`CustomerID`) REFERENCES Customer (`ID`);
    ALTER TABLE `Order_Product` ADD CONSTRAINT FKOrder_Prod922282 FOREIGN KEY (`OrderID`) REFERENCES `Order` (`ID`);
    ALTER TABLE `Order_Product` ADD CONSTRAINT FKOrder_Prod600571 FOREIGN KEY (`ProductID`) REFERENCES Product (`ID`);
    ALTER TABLE `Product` ADD CONSTRAINT FKProduct65612 FOREIGN KEY (`CategoryID`) REFERENCES Category (`ID`);
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
-- Category Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Category (`CategoryName`, `Description`, `Image`) values
('Cephalexin', 'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', 'http://dummyimage.com/163x174.png/dddddd/000000'),
('Acetaminophen', 'diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus', 'http://dummyimage.com/118x120.png/5fa2dd/ffffff'),
('Oxycodone', 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate', 'http://dummyimage.com/156x102.png/5fa2dd/ffffff'),
('Dextroamphetamine', 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede', 'http://dummyimage.com/115x190.png/dddddd/000000'),
('LBEL EFFET PARFAIT', 'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis', 'http://dummyimage.com/153x178.png/dddddd/000000'),
('BEAN', 'aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales', 'http://dummyimage.com/146x179.png/dddddd/000000'),
('Ibuprofen', 'purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend', 'http://dummyimage.com/118x117.png/dddddd/000000'),
('Gelato APF', 'sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 'http://dummyimage.com/160x137.png/ff4444/ffffff'),
('Acetaminophen', 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit', 'http://dummyimage.com/198x191.png/5fa2dd/ffffff'),
('Sucralfate', 'amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum', 'http://dummyimage.com/167x177.png/cc0000/ffffff');

-- ~~~~~~~~~~~~~~~~~~~
-- Person Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Joby', 'Klich', 'jklich0@networksolutions.com', '592-795-0203', '063 Heath Pass', 'Miyang', 2119);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Daniella', 'Elam', 'delam1@g.co', '697-761-8833', '6 Dakota Park', 'San Ignacio', 5299);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Ilse', 'Di Biasio', 'idibiasio2@narod.ru', '541-299-9159', '85141 Dixon Junction', 'Lugui', 4955);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Regina', 'Stute', 'rstute3@is.gd', '641-223-3043', '992 Anderson Point', 'Horokhiv', 1617);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Kellia', 'Roderigo', 'kroderigo4@zdnet.com', '295-824-7266', '8 Sachtjen Place', 'Monte Carmelo', 9700);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Olympe', 'Somers', 'osomers5@cafepress.com', '618-345-6740', '29 Little Fleur Terrace', 'Calceta', 4766);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Craig', 'Oxbe', 'coxbe6@digg.com', '526-911-4576', '96472 Ramsey Road', 'Pingqiao', 6372);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Kristal', 'Woakes', 'kwoakes7@omniture.com', '826-274-1476', '67 Ruskin Plaza', 'Gombong', 8588);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Ida', 'Studdeard', 'istuddeard8@oaic.gov.au', '319-860-1251', '16 Heffernan Alley', 'Lizhuangzi', 5852);
insert into Person (`FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `PostCode`) values ('Izabel', 'Mozzi', 'imozzi9@go.com', '877-489-5225', '38509 Starling Center', 'Carrières-sur-Seine', 1182);


-- ~~~~~~~~~~~~~~~~~~~
-- Employee Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Employee (`PersonID`, `Role`) values (1, 'quam');
insert into Employee (`PersonID`, `Role`) values (2, 'felis');
insert into Employee (`PersonID`, `Role`) values (3, 'diam');
insert into Employee (`PersonID`, `Role`) values (4, 'orci');
insert into Employee (`PersonID`, `Role`) values (5, 'congue');
insert into Employee (`PersonID`, `Role`) values (6, 'sollicitudin');
insert into Employee (`PersonID`, `Role`) values (7, 'curabitur');
insert into Employee (`PersonID`, `Role`) values (8, 'dis');
insert into Employee (`PersonID`, `Role`) values (9, 'hac');
insert into Employee (`PersonID`, `Role`) values (10, 'congue');


-- ~~~~~~~~~~~~~~~~~~~
-- Customer Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Customer (`PersonID`) values (1);
insert into Customer (`PersonID`) values (2);
insert into Customer (`PersonID`) values (3);
insert into Customer (`PersonID`) values (4);
insert into Customer (`PersonID`) values (5);
insert into Customer (`PersonID`) values (6);
insert into Customer (`PersonID`) values (7);
insert into Customer (`PersonID`) values (8);
insert into Customer (`PersonID`) values (9);
insert into Customer (`PersonID`) values (10);


-- ~~~~~~~~~~~~~~~~~~~
-- Payment Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Payment (`CustomerID`, `PaymentDate`, `Amount`) values
(7, '2020-07-20', 96),
(4, '2021-01-13', 81),
(1, '2021-03-29', 48),
(4, '2020-07-21', 77),
(4, '2021-05-07', 43),
(4, '2020-10-17', 22),
(9, '2021-03-24', 44),
(3, '2020-11-13', 69),
(2, '2020-12-03', 64),
(6, '2020-07-31', 38);

-- ~~~~~~~~~~~~~~~~~~~
-- Product Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Product (`CategoryID`, `LastModifiedBy`, `Name`, `Manufacturer`, `Description`, `QtyInStock`, `Price`, `MSRP`, `Image`, `LastModifiedDate`, `IsAvailable`) values
(4, 4, 'pulvinar', 'nascetur', 'proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis', 7, 79.24, 47.82, 'http://dummyimage.com/155x100.png/ff4444/ffffff', '2021-01-28', 1),
(9, 8, 'iaculis','diam', 'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 14, 70.37, 80.78, 'http://dummyimage.com/100x100.png/ff4444/ffffff', '2021-03-16', 1),
(8, 5, 'blandit', 'curae', 'nunc rhoncus dui vel sem sed sagittis nam congue risus', 18, 76.71, 52.9, 'http://dummyimage.com/240x100.png/dddddd/000000', '2020-09-09', 1),
(10, 3, 'amet', 'nisl', 'enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 1, 34.91, 45.41, 'http://dummyimage.com/133x100.png/ff4444/ffffff', '2020-10-06', 1),
(5, 3, 'rhoncus','libero', 'quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus', 19, 67.55, 90.18, 'http://dummyimage.com/212x100.png/cc0000/ffffff', '2021-06-27', 1),
(2, 7, 'pretium','porttitor', 'congue etiam justo etiam pretium iaculis justo in hac habitasse', 4, 51.49, 58.76, 'http://dummyimage.com/153x100.png/ff4444/ffffff', '2020-12-16', 1),
(4, 7, 'ligula', 'ligula', 'lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer', 2, 87.07, 36.92, 'http://dummyimage.com/235x100.png/cc0000/ffffff', '2020-09-13', 1),
(8, 5, 'pretium', 'nonummy','posuere nonummy integer non velit donec diam neque vestibulum eget vulputate', 2, 49.21, 96.84, 'http://dummyimage.com/169x100.png/cc0000/ffffff', '2021-07-29', 1),
(8, 8, 'dictumst', 'dapibus','nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at', 19, 21.36, 88.71, 'http://dummyimage.com/233x100.png/dddddd/000000', '2020-07-24', 1),
(9, 8, 'at', 'quis','justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 4, 86.29, 38.43, 'http://dummyimage.com/178x100.png/dddddd/000000', '2021-07-28', 1);

-- ~~~~~~~~~~~~~~~~~~~
-- Order Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (3, 1, 'lorem', '2020-07-23', '2021-06-29', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', '05f8e6d6-7ad9-44c8-af48-29626f412b97', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (2, 9, 'integer', '2020-12-29', '2020-08-16', 'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing', '1e05f5a5-743d-4489-8611-b9f90f328081', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (2, 1, 'vulputate', '2020-10-21', '2021-01-11', 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat', 'a95461b5-252c-4c85-8372-dae867df8e9e', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (5, 10, 'aenean', '2020-11-26', '2020-11-26', 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget', '321e54ad-ca71-437f-a92e-7cf6591d742a', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (1, 10, 'a', '2020-11-04', '2021-05-09', 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', '8e20eb10-c282-464b-bdef-57ceb9e7b7db', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (1, 10, 'a', '2020-11-04', '2021-05-09', 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', '8e20eb10-c282-464b-bdef-57ceb9e7b7db', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (9, 8, 'condimentum', '2021-02-26', '2021-01-28', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at', 'b223bd27-bcba-4d87-9c46-ccf3dca21d46', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (2, 6, 'ut', '2020-12-21', '2021-01-03', null, '0ae0bb95-8e7a-4cf6-ab8f-8fd2b1f37f49', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (2, 10, 'sit', '2021-04-20', '2021-01-27', 'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit', '2d09e1c6-59ff-42a6-92d0-954f32cf63ca', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (1, 9, 'lorem', '2020-08-11', '2021-06-25', 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', '3834c915-9bcf-4e10-8b6a-5209325f400d', 0);
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`, `IsDeleted`) values (4, 7, 'tristique', '2020-10-26', '2020-10-17', 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis', 'afabe505-1ba3-474e-be31-7c3c6cacfc9f', 0);

-- ~~~~~~~~~~~~~~~~~~~
-- Order_Product Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (1, 6, 3, 31.83);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (2, 6, 2, 95.5);
insert into Order_Product (`OrderID`, `ProductID`, `Qty`, `PriceEach`) values (3, 2, 4, 47.44);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (4, 6, 1, 71.19);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (5, 7, 1, 79.02);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (6, 4, 2, 62.25);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (7, 4, 1, 82.23);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (8, 2, 1, 74.22);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (9, 9, 2, 16.62);
insert into Order_Product (`OrderID` , `ProductID`, `Qty`, `PriceEach`) values (10, 1, 3, 5.64);


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- SELECT Statements
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM `Category`;
SELECT * FROM `Person`;
SELECT * FROM `Employee`;
SELECT * FROM `Customer`;
SELECT * FROM `Product`;
SELECT * FROM `Payment`;
SELECT * FROM `Order`;
SELECT * FROM `Order_Product`;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- DELETE Statements
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- DELETE * FROM Order_Product;
-- DELETE * FROM Order;
-- DELETE * FROM Product;
-- DELETE * FROM Payment;
-- DELETE * FROM Customer;
-- DELETE * FROM Employee;
-- DELETE * FROM Person;
-- DELETE * FROM Category;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Procedures
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
