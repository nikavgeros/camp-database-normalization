-- Create Staff table to store staff details
CREATE TABLE Staff (
 staffNo int PRIMARY KEY,
 staffName varchar(30) NOT NULL,
 staffSurname varchar(30) NOT NULL
);

-- Create Payment table to store payment details
CREATE TABLE Payment (
 payCode int PRIMARY KEY,
 payMethod varchar (20) NOT NULL CONSTRAINT ck_pm CHECK (payMethod='CC' OR payMethod='CH' OR payMethod='CA')
);

-- Create Customer table to store customer details
CREATE TABLE Customer (
 custCode int PRIMARY KEY,
 custName varchar(30) NOT NULL,
 custSurname varchar(30) NOT NULL,
 custPhone varchar(20) NOT NULL
);

-- Create Booking table to store booking details
CREATE TABLE Booking (
 bookCode int PRIMARY KEY,
 bookDt date NOT NULL,
 payCode int NOT NULL,
 custCode int NOT NULL,
 staffNo int NOT NULL,
 FOREIGN KEY (payCode) REFERENCES Payment(payCode),
 FOREIGN KEY (custCode) REFERENCES Customer(custCode),
 FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
);

-- Create Camping table to store camping details
CREATE TABLE Camping (
 campCode char(3) PRIMARY KEY,
 campName varchar(50) NOT NULL,
 numOfEmp int NOT NULL
);

-- Create Category table to store category details
CREATE TABLE Category (
 catCode char(1) PRIMARY KEY,
 areaM2 int NOT NULL,
 unitCost numeric(4,2) NOT NULL
);

-- Create Spot table to store spot details within campsites
CREATE TABLE Spot (
 campCode char(3) NOT NULL,
 empNo int NOT NULL,
 catCode char(1) NOT NULL,
 PRIMARY KEY (campCode, empNo),
 FOREIGN KEY (campCode) REFERENCES Camping(campCode),
 FOREIGN KEY (catCode) REFERENCES Category(catCode)
);

-- Create Rental table to store rental details
CREATE TABLE Rental (
 bookCode int NOT NULL,
 campCode char(3) NOT NULL,
 empNo int NOT NULL,
 startDt date NOT NULL,
 endDt date NOT NULL,
 noPers int NOT NULL,
 PRIMARY KEY (bookCode, campCode, empNo, startDt),
 FOREIGN KEY (bookCode) REFERENCES Booking(bookCode),
 FOREIGN KEY (campCode, empNo) REFERENCES Spot(campCode, empNo)
);