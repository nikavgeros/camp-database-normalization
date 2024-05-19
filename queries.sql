-- Select the staff member(s) with the highest number of bookings
SELECT staffName, staffSurname, COUNT(bookCode) AS numberOfBookings
FROM Staff
JOIN Booking ON Staff.staffNo = Booking.staffNo
GROUP BY staffName, staffSurname
HAVING COUNT(bookCode) = (
    SELECT MAX(numberOfBookings) 
    FROM (
        SELECT COUNT(bookCode) AS numberOfBookings
        FROM Staff
        JOIN Booking ON Staff.staffNo = Booking.staffNo
        GROUP BY staffName, staffSurname
    ) AS bookingCounts
);

-- Select the total revenue for each camp based on rentals
SELECT campName, 
  SUM((endDt - startDt + 1) * noPers * unitCost) AS totalRevenue
FROM Rental
JOIN Spot ON Rental.campCode = Spot.campCode 
          AND Rental.empNo = Spot.empNo
JOIN Category ON Spot.catCode = Category.catCode
JOIN Camping ON Spot.campCode = Camping.campCode
GROUP BY campName;