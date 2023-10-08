CREATE TRIGGER reservations_set_party_size
    BEFORE UPDATE ON Reservations
    FOR EACH ROW
BEGIN
    SET NEW.partySize = 13;
END