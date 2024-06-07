DELIMITER $$

CREATE PROCEDURE BuyBook (
    IN p_ISBN CHAR(13),
    IN p_Namebook VARCHAR(255),
    IN p_Price DECIMAL(10,2),
    IN p_Orders INT,
    IN p_SellerNumber CHAR(20),
    IN p_Surname VARCHAR(255),
    IN p_Name VARCHAR(255),
    IN p_Patronymic VARCHAR(255),
    IN p_Telephone CHAR(20),
    IN p_ClientsId INT ,
    IN p_Salesmen_id INT
)
BEGIN
    DECLARE book_id INT;
    DECLARE sale_id INT;

    START TRANSACTION;

    INSERT INTO books (ISBN, title, price) VALUES (p_ISBN, p_Namebook, p_Price) 
    ON DUPLICATE KEY UPDATE title = VALUES(title), price = VALUES(price);

    SELECT id INTO book_id FROM books WHERE ISBN = p_ISBN LIMIT 1;

    INSERT INTO orders (id, date, clients_id, books_id) VALUES (p_Orders, NOW(), p_ClientsId, book_id);  -- Добавлено значение для столбца clients_id
    SET sale_id = LAST_INSERT_ID();

    INSERT INTO salesmen (phon_number, surname, name, patronymic, rate, sales_order, salesmen_id) 
    VALUES (p_SellerNumber, p_Surname, p_Name, p_Patronymic, 'full', p_Orders, p_Salesmen_id);

    COMMIT;
END $$

DELIMITER ;
