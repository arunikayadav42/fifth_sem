CREATE TABLE ITEM
(PRODUCT varchar(16),
QUANTITY integer,
PRICE decimal,
COST decimal);

INSERT INTO ITEM(PRODUCT, QUANTITY, PRICE) VALUES ('Winter Tire', '4','
100.00');

SELECT * FROM ITEM;

DELIMITER //
CREATE TRIGGER DISPLAY_COST_CHANGE 
BEFORE INSERT ON ITEM
FOR EACH ROW
BEGIN
SET NEW.COST = NEW.PRICE * NEW.QUANTITY;
END;//
DELIMITER ;


CREATE TABLE GRADES
(ID DECIMAL,
 T1 DECIMAL,
 T2 DECIMAL,
 T3 DECIMAL,
 MARK DECIMAL
);

SELECT * FROM GRADES;

INSERT INTO GRADES(ID, T1, T2, T3) VALUES ('2', '23','24', '25');

DELIMITER //
CREATE TRIGGER DISPLAY_MARK_CHANGE
BEFORE INSERT ON GRADES
FOR EACH ROW
BEGIN
SET NEW.MARK = (NEW.T1+NEW.T2+NEW.T3)/3;
END;//
DELIMITER ;

CREATE TABLE Product 
(productId INTEGER, 
 productName varchar(50), 
 categoryName varchar(50), 
 packageDesc varchar(100), 
 price decimal(9, 2),
 PRIMARY KEY (productId)
 );

CREATE TABLE Customer (
customerId int NOT NULL PRIMARY KEY,
password VARCHAR(20) NOT NULL,
cname VARCHAR(50) NOT NULL,
street VARCHAR(50),
city VARCHAR(20),
state VARCHAR(2),
zipcode VARCHAR(10),
phone VARCHAR(10),
email VARCHAR(30) NOT NULL
);

CREATE TABLE Orders (
orderId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
customerId int,
totalAmount decimal(9,2),
CONSTRAINT FK_Orders_Customer FOREIGN KEY (customerId) REFERENCES
Customer(customerId)
);

CREATE TABLE OrderedProduct (
orderId int NOT NULL,
productId int NOT NULL,
quantity int,
price decimal(9,2),
PRIMARY KEY (OrderId, ProductId),
CONSTRAINT FK_OrderedProduct_Order FOREIGN KEY (OrderId) REFERENCES
Orders(OrderId),
CONSTRAINT FK_OrderedProduct_Product FOREIGN KEY (ProductId) REFERENCES
Product(ProductId)
);

DELIMITER //
CREATE TRIGGER UPDATE_AMOUNT
AFTER UPDATE ON OrderedProduct
FOR EACH ROW
BEGIN
UPDATE Orders
SET Orders.totalAmount = NEW.quantity*NEW.price
WHERE Orders.orderId = new.orderId;
END;//
DELIMITER ;

DELIMITER //
CREATE TRIGGER UPDATE_CUSTOMER_NEW
BEFORE DELETE ON Customer
FOR EACH ROW
BEGIN
DELETE FROM OrderedProduct
WHERE OrderedProduct.orderId 
IN (SELECT orderId from Orders WHERE customerId = OLD.customerId);
DELETE FROM Orders
WHERE customerId = OLD.customerId;
END;//
DELIMITER ;
