DELIMITER $$
CREATE FUNCTION calculate_vat(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE vat DECIMAL(10,2);
    SET vat = amount * 0.2; -- 20% ставка НДС
    RETURN vat;
END $$
DELIMITER ;