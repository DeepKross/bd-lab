CREATE FUNCTION CountVegetarianDishes(restId INT) RETURNS INT
BEGIN
    DECLARE vegCount INT;

    -- Підрахунок кількості вегетаріанських страв для конкретного ресторану
    SELECT COUNT(*) INTO vegCount
    FROM Dishes
    WHERE restaurantId = restId AND vegetarian = TRUE;

    RETURN IFNULL(vegCount, 0);
END