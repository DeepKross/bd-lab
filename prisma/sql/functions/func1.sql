DELIMITER //
CREATE FUNCTION GetAverageRating(restId INT) RETURNS FLOAT
BEGIN
    DECLARE avgRating FLOAT;

    SELECT AVG(rating) INTO avgRating
    FROM Reviews
    WHERE restaurantId = restId;

    RETURN avgRating;
END //
DELIMITER ;
