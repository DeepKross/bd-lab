CREATE FUNCTION TotalSalesForRestaurant(restId INT, startDate DATE, endDate DATE) RETURNS FLOAT
BEGIN
    DECLARE totalSales FLOAT;

    -- Обчислити загальну суму транзакцій для ресторану за певний період часу
    SELECT SUM(paymantAmount) INTO totalSales
    FROM Transactions
    WHERE orderId IN (
        SELECT id
        FROM Orders
        WHERE tableId IN (
            SELECT id
            FROM Tables
            WHERE restaurantId = restId
        )
    )
      AND paymentDate BETWEEN startDate AND endDate;

    RETURN IFNULL(totalSales, 0);
END