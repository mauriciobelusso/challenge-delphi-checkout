DROP DATABASE IF EXISTS CHECKOUT;

CREATE DATABASE CHECKOUT;

USE CHECKOUT;

CREATE TABLE CUSTOMERS (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL,
	CITY VARCHAR(40) NOT NULL,
	UF CHAR(2) NOT NULL
);

CREATE TABLE PRODUCTS (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	DESCRIPTION VARCHAR(100) NOT NULL,
	SALE_PRICE NUMERIC(18,5) NOT NULL
);

CREATE TABLE ORDERS (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CUSTOMER_ID INT NOT NULL,
	ISSUE_DATE DATE NOT NULL,
	TOTAL NUMERIC(18,5) NOT NULL,
	CONSTRAINT FK_ORDERS_CUSTOMERS FOREIGN KEY (CUSTOMER_ID)
		REFERENCES CUSTOMERS(ID)
);

CREATE TABLE ORDERS_PRODUCTS(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ORDER_ID INT NOT NULL,
	PRODUCT_ID INT NOT NULL,
	QUANTITY NUMERIC(18,5) NOT NULL,
	UNIT_VALUE NUMERIC(18,5) NOT NULL,
	TOTAL NUMERIC(18,5) NOT NULL,
	CONSTRAINT FK_ORDERS FOREIGN KEY (ORDER_ID)
		REFERENCES ORDERS(ID),
	CONSTRAINT FK_ORDERS_PRODUCTS FOREIGN KEY (PRODUCT_ID)
		REFERENCES PRODUCTS(ID)
);

CREATE INDEX IDX_ORDERS_ISSUE_DATE ON ORDERS(ISSUE_DATE);