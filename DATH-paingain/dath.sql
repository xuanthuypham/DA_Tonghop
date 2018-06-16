DROP DATABASE IF exists dath;
CREATE DATABASE dath;
USE dath;
CREATE TABLE PG_CATEGORIES(
	 CATEGORY_ID INT auto_increment primary KEY,
	 CATEGORY_NAME varchar(100) NOT NULL,
	 DESCRIPTION VARCHAR(300),
	 SORT_INDEX INT NOT NULL,
	 CATEGORY_STATUS INT NOT NULL DEFAULT 1
);

INSERT INTO PG_CATEGORIES(CATEGORY_NAME, DESCRIPTION, SORT_INDEX) VALUES ('Quần short','',1);

	
CREATE TABLE PG_ROLES(
	ROLE_ID INT auto_increment primary KEY,
	ROLE_NAME VARCHAR(100) NOT NULL,
	PARENT INT
);
	INSERT INTO PG_ROLES(ROLE_NAME,PARENT) VALUE ('ADMIN',0);
CREATE TABLE PG_USERS(
	RECORD_ID INT auto_increment PRIMARY KEY,
	USER_ID varchar(50) unique NOT NULL,
	FIRST_NAME VARCHAR(50) NOT NULL,
	LAST_NAME varchar (50) NOT NULL,
	ADDRESS VARCHAR(100),
	PHONE_NUMBER VARCHAR(20) NOT NULL,
	CARD_ID VARCHAR(20),
	EMAIL VARCHAR(100),
	SEX tinyint(1) default 0,
	USER_PASSWORD VARCHAR(50) NOT NULL,
	ROLE_ID INT,
	CREATE_TIME timestamp DEFAULT current_timestamp,
	MODIFIED_TIME timestamp,
	USER_STATUS INT NOT NULL,
	FOREIGN KEY (ROLE_ID) REFERENCES PG_ROLES(ROLE_ID)
);
-- LOG ACTION
CREATE TABLE PG_LOG(
	LOG_ID INT auto_increment primary KEY,
	EMPLOYEE_ID INT NOT NULL,
	CREATED_TIME timestamp default current_timestamp,
	DESCRIPTION VARCHAR(300) NOT NULL,
	LOG_VALUE VARCHAR(300) NOT NULL,
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES PG_USERS(RECORD_ID)
);

CREATE TABLE PG_SUPPLIERS(
	SUPPLIER_ID INT auto_increment primary key,
	COMPANY_NAME VARCHAR(100) NOT NULL,
	CONTACT_NAME VARCHAR(100) NOT NULL,
	ADDRESS VARCHAR(100),
	REGION VARCHAR(100),
	PHONE VARCHAR(20) NOT NULL,
	EMAIL VARCHAR(100),
	SUPPLIER_STATUS INT DEFAULT 1
);

CREATE TABLE PG_PRODUCTS(
	PRODUCT_ID INT auto_increment primary key,
	PRODUCT_NAME VARCHAR(100) NOT NULL,
	SUPPLIER_ID INT NOT NULL,
	CATEGORY_ID INT NOT NULL,
	QUANTITY INT DEFAULT 0 NOT NULL check(QUANTITY>=0),
	UNIT_PRICE INT default 0 NOT NULL check(UNIT_PRICE>=0),
	UNIT_ORDER INT DEFAULT 0 NOT NULL check(UNIT_ORDER>=0),
	DESCRIPTION VARCHAR(300),
	PRODUCT_STATUS INT DEFAULT 1 NOT NULL,
	CREATE_TIME timestamp DEFAULT current_timestamp,
	MODIFIED_TIME timestamp,
	IS_NEW tinyint(1) DEFAULT 1,
	IS_HOT tinyint(1) default 1,
	FOREIGN KEY (SUPPLIER_ID) REFERENCES PG_SUPPLIERS(SUPPLIER_ID),
	FOREIGN KEY (CATEGORY_ID) REFERENCES PG_CATEGORIES(CATEGORY_ID)
);
-- SP KHUYEN MAI
CREATE TABLE PG_PRODUCT_SALES(
	SALE_ID INT auto_increment primary KEY,
	PRODUCT_ID INT NOT NULL,
	START_DATE timestamp NOT NULL,
	END_DATE timestamp NOT NULL,
	SALE_VALUE INT NOT NULL,
	IS_PERCENT tinyint(1) DEFAULT 0,
	SALES_STATUS INT DEFAULT 1,
	FOREIGN KEY (PRODUCT_ID) REFERENCES PG_PRODUCTS(PRODUCT_ID)
);

CREATE TABLE PG_PRODUCT_PICTURES(
	PICTURE_SET_ID INT auto_increment primary key,
	PATH VARCHAR(300) NOT NULL,
	PICTURE_TYPE VARCHAR(20),
	PICTURE_STATUS INT DEFAULT 1,
	PRODUCT_ID INT NOT NULL,
	ORDER_INDEX INT NOT NULL,
	FOREIGN KEY (PRODUCT_ID) REFERENCES PG_PRODUCTS(PRODUCT_ID)
);
-- PHAN QUYEN NG DUNG VOI CAC CHUC NANG
CREATE TABLE PG_ROLE_PERMISSION(
	PERMISSION_ID INT auto_increment primary KEY,
	ROLE_ID INT NOT NULL,
	CATEGORY_ID INT NOT NULL,
	IS_INSERT tinyint(1) DEFAULT 0,
	IS_UPDATE tinyint(1) DEFAULT 0,
	IS_DELETE tinyint(1) DEFAULT 0,
	IS_READ tinyint(1) DEFAULT 0,
	PER_STATUS INT DEFAULT 1,
	DESCRIPTION VARCHAR(200),
	FOREIGN KEY (ROLE_ID) REFERENCES PG_ROLES(ROLE_ID),
	FOREIGN KEY (CATEGORY_ID) REFERENCES PG_CATEGORIES(CATEGORY_ID)
);
-- DAT HANG
CREATE TABLE PG_ORDERS(
	ORDER_ID INT auto_increment primary KEY,
	CUSTOMER_ID INT NOT NULL,
	EMPLOYEE_ID INT NOT NULL,
	ORDER_DATE timestamp,
	APPROVED_DATE timestamp, 
	ORDER_STATUS INT DEFAULT 1,
	SHIP_NAME VARCHAR(100),
	SHIP_ADDRESS VARCHAR(300),
	SHIP_PHONE VARCHAR(20),
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES PG_USERS(RECORD_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES PG_USERS(RECORD_ID)
);
-- CHI TIET DAT HANG
CREATE TABLE PG_ORDER_DETAILS(
	ORDER_DETAIL_ID INT auto_increment primary KEY,
	ORDER_ID INT NOT NULL,
	PRODUCT_ID INT NOT NULL,
	AMOUNT INT NOT NULL default 1 check(AMOUNT>=1),
	UNIT_PRICE INT NOT NULL default 0 check( UNIT_PRICE>=0),
	UNIT_SALE INT NOT NULL default 0 check( UNIT_SALE>=0),
	FOREIGN KEY (PRODUCT_ID) REFERENCES PG_PRODUCTS(PRODUCT_ID),
	FOREIGN KEY (ORDER_ID) REFERENCES PG_ORDERS(ORDER_ID)
)


