CREATE TRIGGER reviews_before_insert
    BEFORE UPDATE ON Reviews
    FOR EACH ROW
BEGIN
    IF NEW.rating > 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rating exceeds the maximum allowable value.';
    END IF;
END