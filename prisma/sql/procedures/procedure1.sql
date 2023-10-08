CREATE PROCEDURE AddReviewToRestaurant(
    IN restId INT,
    IN reviewerName VARCHAR(32),
    IN reviewRating INT,
    IN reviewText TEXT
)
BEGIN
    INSERT INTO Reviews (reviewersName, restaurantId, rating, reviewText, reviewDate)
    VALUES (reviewerName, restId, reviewRating, reviewText, NOW());
END
