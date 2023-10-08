CREATE PROCEDURE AvailableDishesForRestaurant(IN restId INT)
BEGIN
    SELECT * FROM Dishes
    WHERE restaurantId = restId AND status = 'Available';
END