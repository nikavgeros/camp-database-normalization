-- Insert unique customer data from campData into Customer table
INSERT INTO Customer
SELECT DISTINCT custCode, custName, custSurname, custPhone
FROM campData;

-- Insert unique staff data from campData into Staff table
INSERT INTO Staff
SELECT DISTINCT staffNo, staffName, staffSurname
FROM campData;

-- Insert unique payment data from campData into Payment table
INSERT INTO Payment
SELECT DISTINCT payCode, payMethod
FROM campData;

-- Insert unique camping data from campData into Camping table
INSERT INTO Camping
SELECT DISTINCT campCode, campName, numOfEmp
FROM campData;

-- Insert unique category data from campData into Category table
INSERT INTO Category
SELECT DISTINCT catCode, areaM2, unitCost
FROM campData;

-- Insert unique spot data from campData into Spot table
INSERT INTO Spot
SELECT DISTINCT campCode, empNo, catCode
FROM campData;

-- Insert unique booking data from campData into Booking table
INSERT INTO Booking
SELECT DISTINCT bookCode, bookDt, payCode, custCode, staffNo
FROM campData;

-- Insert unique rental data from campData into Rental table
INSERT INTO Rental
SELECT DISTINCT bookCode, campCode, empNo, startDt, endDt, noPers
FROM campData;
