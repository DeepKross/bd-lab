CREATE PROCEDURE UpdateTableStatus(
    IN tblId INT,
    IN newStatus VARCHAR(20)
)
BEGIN
    UPDATE Tables
    SET status = newStatus
    WHERE id = tblId;
END