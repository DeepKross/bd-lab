CREATE FUNCTION TotalSeatsInRestaurant(restId INT) RETURNS INT
BEGIN
    DECLARE totalSeats INT;

    SELECT SUM(seats) INTO totalSeats
    FROM Tables
    WHERE restaurantId = restId;

    RETURN IFNULL(totalSeats, 0);
END
