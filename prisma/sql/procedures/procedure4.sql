CREATE PROCEDURE ToggleTableStatus(
    IN tblId INT
)
BEGIN
    DECLARE currentStatus VARCHAR(20);

    -- Отримання поточного статусу столика
    SELECT status INTO currentStatus FROM Tables WHERE id = tblId;

    -- Зміна статусу на протилежний
    IF currentStatus = 'вільний' THEN
        UPDATE Tables SET status = 'зайнятий' WHERE id = tblId;
    ELSE
        UPDATE Tables SET status = 'вільний' WHERE id = tblId;
    END IF;

END
