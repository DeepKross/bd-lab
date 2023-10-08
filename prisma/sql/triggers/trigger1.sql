CREATE TRIGGER before_insert_dishes
    BEFORE INSERT ON Dishes
    FOR EACH ROW
BEGIN
    IF NEW.name IS NULL OR NEW.name = '' THEN
        SET NEW.name = 'MockDish';
    END IF;

    IF NEW.portionWeight IS NULL THEN
        SET NEW.portionWeight = 250;
    END IF;

    IF NEW.price IS NULL THEN
        SET NEW.price = 10.99;
    END IF;

    IF NEW.status IS NULL OR NEW.status = '' THEN
        SET NEW.status = 'Available';
    END IF;

    IF NEW.updatedAt IS NULL THEN
        SET NEW.updatedAt = NOW();
    END IF;
END;