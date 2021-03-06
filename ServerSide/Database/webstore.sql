DROP
DATABASE IF EXISTS WebstoreDB;
CREATE
DATABASE WebstoreDB;
USE
WebstoreDB;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Procedure to create the all of the tables in the database
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP PROCEDURE IF EXISTS makeWebstoreDB;
DELIMITER
//
CREATE PROCEDURE makeWebstoreDB()
BEGIN
CREATE TABLE Category
(
    CategoryID   int(10) NOT NULL AUTO_INCREMENT,
    CategoryName varchar(255) NOT NULL,
    Description  varchar(255),
    Image        varchar(100),
    IsDeleted    tinyint(1) NOT NULL,
    PRIMARY KEY (CategoryID)
);
CREATE TABLE Product
(
    ProductID        int(10) NOT NULL AUTO_INCREMENT,
    CategoryID       int(10) NOT NULL,
    LastModifiedBy   int(10) NOT NULL,
    ProductName      varchar(255),
    Manufacturer     varchar(255),
    Description      varchar(255),
    QtyInStock       int(10),
    Price            decimal(13, 2),
    MSRP             varchar(255),
    Image            varchar(100),
    LastModifiedDate date NOT NULL,
    IsAvailable      tinyint(1) NOT NULL,
    PRIMARY KEY (ProductID)
);
CREATE TABLE `Order`
(
    OrderID        int(10) NOT NULL AUTO_INCREMENT,
    CustomerID     int(10) NOT NULL,
    PaymentID      int(10),
    Status         varchar(255) NOT NULL,
    OrderDate      date,
    ShippedDate    date,
    Comments       varchar(255),
    TrackingNumber varchar(255),
    PRIMARY KEY (OrderID)
);
CREATE TABLE Payment
(
    PaymentID   int(10) NOT NULL AUTO_INCREMENT,
    CustomerID  int(10) NOT NULL,
    PaymentDate date,
    Amount      decimal(13, 2) NOT NULL,
    PRIMARY KEY (PaymentID)
);
CREATE TABLE Customer
(
    CustomerID int(10) NOT NULL AUTO_INCREMENT,
    PersonID   int(10) NOT NULL,
    PRIMARY KEY (CustomerID)
);
CREATE TABLE Order_Product
(
    OrderID   int(10) NOT NULL,
    ProductID int(10) NOT NULL,
    Qty       int(10) NOT NULL,
    PriceEach decimal(13, 2) NOT NULL,
    PRIMARY KEY (OrderID,
                 ProductID)
);
CREATE TABLE Employee
(
    EmployeeID int(10) NOT NULL AUTO_INCREMENT,
    PersonID   int(10) NOT NULL,
    Role       varchar(255),
    PRIMARY KEY (EmployeeID)
);
CREATE TABLE Person
(
    PersonID  int(10) NOT NULL AUTO_INCREMENT,
    FirstName varchar(255) NOT NULL,
    LastName  varchar(255) NOT NULL,
    Email     varchar(255) NOT NULL UNIQUE,
    Password  binary(60) NOT NULL,
    Phone     varchar(255),
    Address   varchar(255),
    City      varchar(255),
    PostCode  int(4),
    IsDeleted tinyint(1) NOT NULL,
    PRIMARY KEY (PersonID)
);
ALTER TABLE Payment
    ADD CONSTRAINT FKPayment617515 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE `Order`
    ADD CONSTRAINT FKOrder835009 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE Order_Product
    ADD CONSTRAINT FKOrder_Prod381299 FOREIGN KEY (OrderID) REFERENCES `Order` (OrderID);
ALTER TABLE Order_Product
    ADD CONSTRAINT FKOrder_Prod535307 FOREIGN KEY (ProductID) REFERENCES Product (ProductID);
ALTER TABLE Product
    ADD CONSTRAINT FKProduct608764 FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID);
ALTER TABLE Customer
    ADD CONSTRAINT FKCustomer415114 FOREIGN KEY (PersonID) REFERENCES Person (PersonID);
ALTER TABLE Employee
    ADD CONSTRAINT FKEmployee879888 FOREIGN KEY (PersonID) REFERENCES Person (PersonID);
ALTER TABLE Product
    ADD CONSTRAINT FKProduct47824 FOREIGN KEY (LastModifiedBy) REFERENCES Employee (EmployeeID);
ALTER TABLE `Order`
    ADD CONSTRAINT FKOrder355972 FOREIGN KEY (PaymentID) REFERENCES Payment (PaymentID);
END
//
DELIMITER ;
CALL makeWebstoreDB();

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- INSERT Test Data
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~~~
-- Category Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into `Category` (`CategoryName`, `Description`, `Image`, `IsDeleted`)
values ('Cephalexin',
        'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac',
        'http://dummyimage.com/163x174.png/dddddd/000000',
        0),
       ('Acetaminophen',
        'diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus',
        'http://dummyimage.com/118x120.png/5fa2dd/ffffff',
        0),
       ('Oxycodone',
        'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate',
        'http://dummyimage.com/156x102.png/5fa2dd/ffffff',
        0),
       ('Dextroamphetamine', 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede',
        'http://dummyimage.com/115x190.png/dddddd/000000',
        0),
       ('LBEL EFFET PARFAIT',
        'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis',
        'http://dummyimage.com/153x178.png/dddddd/000000',
        0),
       ('BEAN', 'aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales',
        'http://dummyimage.com/146x179.png/dddddd/000000',
        0),
       ('Ibuprofen', 'purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend',
        'http://dummyimage.com/118x117.png/dddddd/000000',
        0),
       ('Gelato APF',
        'sed tristique in tempus sit amet sem fusce consequat',
        'http://dummyimage.com/160x137.png/ff4444/ffffff',
        0),
       ('Acetaminophen',
        'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit',
        'http://dummyimage.com/198x191.png/5fa2dd/ffffff',
        0),
       ('Sucralfate',
        'amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum',
        'http://dummyimage.com/167x177.png/cc0000/ffffff',
        0);

-- ~~~~~~~~~~~~~~~~~~~
-- Person Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Person (`FirstName`, `LastName`, `Email`, `Password`, `Phone`, `Address`, `City`, `PostCode`, `IsDeleted`)
values ('Joby', 'Klich', 'jklich0@networksolutions.com', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '592-795-0203', '063 Heath Pass', 'Miyang', 2119, 0),
       ('Daniella', 'Elam', 'delam1@g.co', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '697-761-8833', '6 Dakota Park', 'San Ignacio', 5299, 0),
       ('Ilse', 'Di Biasio', 'idibiasio2@narod.ru', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '541-299-9159', '85141 Dixon Junction', 'Lugui', 4955, 0),
       ('Regina', 'Stute', 'rstute3@is.gd', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '641-223-3043', '992 Anderson Point', 'Horokhiv', 1617, 0),
       ('Kellia', 'Roderigo', 'kroderigo4@zdnet.com', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '295-824-7266', '8 Sachtjen Place', 'Monte Carmelo', 9700, 0),
       ('Olympe', 'Somers', 'osomers5@cafepress.com', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '618-345-6740', '29 Little Fleur Terrace', 'Calceta', 4766, 0),
       ('Craig', 'Oxbe', 'coxbe6@digg.com', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '526-911-4576', '96472 Ramsey Road', 'Pingqiao', 6372, 0),
       ('Kristal', 'Woakes', 'kwoakes7@omniture.com', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '826-274-1476', '67 Ruskin Plaza', 'Gombong', 8588, 0),
       ('Ida', 'Studdeard', 'istuddeard8@oaic.gov.au', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '319-860-1251', '16 Heffernan Alley', 'Lizhuangzi', 5852, 0),
       ('Izabel', 'Mozzi', 'imozzi9@go.com', '$2y$08$m.Abjwqff7yA38.nJPf93u8QUUWLcP02fT1my4e.dDPW1DOSXt1kK', '877-489-5225', '38509 Starling Center', 'Carri??res-sur-Seine', 1182, 0);

-- ~~~~~~~~~~~~~~~~~~~
-- Employee Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Employee (`PersonID`, `Role`)
values (1, 'quam'),
       (2, 'felis'),
       (3, 'diam'),
       (4, 'orci'),
       (5, 'congue'),
       (6, 'sollicitudin'),
       (7, 'curabitur'),
       (8, 'dis'),
       (9, 'hac'),
       (10, 'congue');

-- ~~~~~~~~~~~~~~~~~~~
-- Customer Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Customer (`PersonID`)
values (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);

-- ~~~~~~~~~~~~~~~~~~~
-- Payment Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Payment (`CustomerID`, `PaymentDate`, `Amount`)
values (7, '2020-07-20', 96),
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
insert into Product (`CategoryID`, `LastModifiedBy`, `ProductName`, `Manufacturer`, `Description`, `QtyInStock`,
                     `Price`, `MSRP`, `Image`, `LastModifiedDate`, `IsAvailable`)
values (4, 4, 'pulvinar', 'nascetur',
        'proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis', 7, 79.24,
        47.82, 'http://dummyimage.com/155x100.png/ff4444/ffffff', '2021-01-28', 1),
       (9, 8, 'iaculis', 'diam', 'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 14,
        70.37, 80.78, 'http://dummyimage.com/100x100.png/ff4444/ffffff', '2021-03-16', 1),
       (8, 5, 'blandit', 'curae', 'nunc rhoncus dui vel sem sed sagittis nam congue risus', 18, 76.71, 52.9,
        'http://dummyimage.com/240x100.png/dddddd/000000', '2020-09-09', 1),
       (10, 3, 'amet', 'nisl', 'enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 1, 34.91, 45.41,
        'http://dummyimage.com/133x100.png/ff4444/ffffff', '2020-10-06', 1),
       (5, 3, 'rhoncus', 'libero',
        'quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus', 19, 67.55,
        90.18, 'http://dummyimage.com/212x100.png/cc0000/ffffff', '2021-06-27', 1),
       (2, 7, 'pretium', 'porttitor', 'congue etiam justo etiam pretium iaculis justo in hac habitasse', 4, 51.49,
        58.76, 'http://dummyimage.com/153x100.png/ff4444/ffffff', '2020-12-16', 1),
       (4, 7, 'ligula', 'ligula',
        'lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer', 2,
        87.07, 36.92, 'http://dummyimage.com/235x100.png/cc0000/ffffff', '2020-09-13', 1),
       (8, 5, 'pretium', 'nonummy', 'posuere nonummy integer non velit donec diam neque vestibulum eget vulputate', 2,
        49.21, 96.84, 'http://dummyimage.com/169x100.png/cc0000/ffffff', '2021-07-29', 1),
       (8, 8, 'dictumst', 'dapibus',
        'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at', 19, 21.36,
        88.71, 'http://dummyimage.com/233x100.png/dddddd/000000', '2020-07-24', 1),
       (9, 8, 'at', 'quis', 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 4,
        86.29, 38.43, 'http://dummyimage.com/178x100.png/dddddd/000000', '2021-07-28', 1);

-- ~~~~~~~~~~~~~~~~~~~
-- Order Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into `Order` (`CustomerID`, `PaymentID`, `Status`, `OrderDate`, `ShippedDate`, `Comments`, `TrackingNumber`
                     )
values (3, 1, 'lorem', '2020-07-23', '2021-06-29',
        'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae',
        '05f8e6d6-7ad9-44c8-af48-29626f412b97'),
       (2, 9, 'integer', '2020-12-29', '2020-08-16',
        'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing',
        '1e05f5a5-743d-4489-8611-b9f90f328081'),
       (2, 1, 'vulputate', '2020-10-21', '2021-01-11',
        'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat',
        'a95461b5-252c-4c85-8372-dae867df8e9e'),
       (5, 10, 'aenean', '2020-11-26', '2020-11-26',
        'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget',
        '321e54ad-ca71-437f-a92e-7cf6591d742a'),
       (1, 10, 'a', '2020-11-04', '2021-05-09',
        'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit',
        '8e20eb10-c282-464b-bdef-57ceb9e7b7db'),
       (1, 10, 'a', '2020-11-04', '2021-05-09',
        'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit',
        '8e20eb10-c282-464b-bdef-57ceb9e7b7db'),
       (9, 8, 'condimentum', '2021-02-26', '2021-01-28',
        'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at',
        'b223bd27-bcba-4d87-9c46-ccf3dca21d46'),
       (2, 6, 'ut', '2020-12-21', '2021-01-03', null, '0ae0bb95-8e7a-4cf6-ab8f-8fd2b1f37f49'),
       (2, 10, 'sit', '2021-04-20', '2021-01-27',
        'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit',
        '2d09e1c6-59ff-42a6-92d0-954f32cf63ca'),
       (1, 9, 'lorem', '2020-08-11', '2021-06-25', 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl',
        '3834c915-9bcf-4e10-8b6a-5209325f400d'),
       (4, 7, 'tristique', '2020-10-26', '2020-10-17',
        'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis',
        'afabe505-1ba3-474e-be31-7c3c6cacfc9f');

-- ~~~~~~~~~~~~~~~~~~~
-- Order_Product Test Data
-- ~~~~~~~~~~~~~~~~~~~
insert into Order_Product (`OrderID`, `ProductID`, `Qty`, `PriceEach`)
values (1, 6, 3, 31.83),
       (2, 6, 2, 95.5),
       (3, 2, 4, 47.44),
       (4, 6, 1, 71.19),
       (5, 7, 1, 79.02),
       (6, 4, 2, 62.25),
       (7, 4, 1, 82.23),
       (8, 2, 1, 74.22),
       (9, 9, 2, 16.62),
       (10, 1, 3, 5.64);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Procedures
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
