DAY_1

1) DESC EMP;
2) DESC DEPT;
3) SELECT * FROM EMP;
4) SELECT * FROM DEPT;
5) SELECT ENAME FROM EMP;
6) SELECT ENAME,SAL FROM EMP;
7) SELECT DISTINCT DEPTNO FROM EMP;
8) SELECT ENAME FROM EMP WHERE ENAME LIKE 'J%';
9) SELECT ENAME,HIREDATE,SAL FROM EMP;
10) SELECT * FROM EMP WHERE JOB='CLERK';
11) SELECT ENAME,SAL FROM EMP WHERE SAL>2000;
12) SELECT * FROM EMP WHERE DEPTNO NOT IN 30;
13) SELECT EMPNO,ENAME,MGR FROM EMP;
14) SELECT ENAME,MGR,JOB,DEPTNO,SAL FROM EMP WHERE ENAME IN ('ALLEN','ADAMS','JONES','BLAKE');
15) SELECT DISTINCT SAL FROM EMP;
16) SELECT LOC,DEPTNO FROM DEPT WHERE DEPTNO=30;
17) SELECT * FROM DEPT WHERE LOC='NEW YORK';
18) SELECT * FROM EMP ORDER BY ENAME;
19) SELECT * FROM EMP WHERE JOB NOT IN ('SALESMAN','MANAGER');
20) SELECT * FROM EMP WHERE JOB='CLERK' AND SAL>1000;
------------------------------------------------------------------------------------------------------------

DAY_2

1)CREATE TABLE Client_Master
(C_No VARCHAR(4) PRIMARY KEY,
Client_Name VARCHAR(25) NOT NULL,
PINCODE NUMBER(6) NOT NULL,
Birth_Date DATE NOT NULL,
Occupation VARCHAR(15) NOT NULL);

ALTER TABLE CLIENT_MASTER ADD CONSTRAINT check_cno CHECK (C_No LIKE 'C%');
ALTER TABLE CLIENT_MASTER ADD CONSTRAINT check_pin CHECK (LENGTH(PINCODE)=6);

INSERT INTO CLIENT_MASTER VALUES ('C001','Kajal Oza',380026,'14-JULY-1987','Manager');
INSERT INTO CLIENT_MASTER VALUES ('C002','Vraj Shah',380058,'20-NOV-1986','CEO');
INSERT INTO CLIENT_MASTER VALUES ('C003','Dhyan Dave',387903,'17-JUNE-1988','Doctor');
INSERT INTO CLIENT_MASTER VALUES ('C004','Mira Vaid',398006,'05-JAN-1976','Professor');
INSERT INTO CLIENT_MASTER VALUES ('C005','Preeti Patel',390040,'28-FEB-1971','CLERK');

2)CREATE TABLE Product_Master
(P_No VARCHAR(4) PRIMARY KEY,
Description VARCHAR(25) NOT NULL,
Profit_Per NUMBER(5) NOT NULL,
Unit VARCHAR(25) NOT NULL,
Qty_Hand NUMBER(5) NOT NULL,
ReOrder NUMBER(5) NOT NULL,
Sell_P NUMBER(5) NOT NULL,
Cost_P NUMBER(5) NOT NULL);

ALTER TABLE PRODUCT_MASTER ADD CONSTRAINT check_pno CHECK (P_No LIKE 'P%');

INSERT INTO PRODUCT_MASTER VALUES ('P001','T-Shirt',5,'Piece',200,50,350,250); 
INSERT INTO PRODUCT_MASTER VALUES ('P002','Jeans',6,'Piece',150,40,500,350);
INSERT INTO PRODUCT_MASTER VALUES ('P003','Skirt',6,'Piece',100,50,350,200);
INSERT INTO PRODUCT_MASTER VALUES ('P004','Saree',3,'Piece',100,20,800,600);4

3)CREATE TABLE Salesman_Master
(S_No VARCHAR(4) PRIMARY KEY,
Name VARCHAR(25) NOT NULL,
Add1 VARCHAR(25),
Add2 VARCHAR(25),
City VARCHAR(25),
PINCODE NUMBER(6),
State VARCHAR(25),
Salary NUMBER(10),
Target NUMBER(5),
Sales NUMBER(5));

ALTER TABLE SALESMAN_MASTER ADD CONSTRAINT check_sno CHECK (S_No LIKE 'S%');

INSERT INTO SALESMAN_MASTER VALUES ('S001','Aman','3.Dev Appt','Vagh odia','Baroda','','Gujarat',5000,100,50);
INSERT INTO SALESMAN_MASTER VALUES ('S002','Omkar','','','Bhopal','','MP',4500,200,150);
INSERT INTO SALESMAN_MASTER VALUES ('S003','Raj','B-104','Verli','Mumbai','400002','Maharashtra',5500,200,200);
INSERT INTO SALESMAN_MASTER VALUES ('S004','Ashish','1, Smruti','Ghod dol','Surat','','Gujarat',4500,150,100);

CREATE TABLE SALES_ORDER
(ORDER_NO VARCHAR(4) PRIMARY KEY CHECK(ORDER_NO LIKE 'O%'),
CLIENT_NO VARCHAR(4),
ORDER_DATE DATE,
SALESMAN_NO VARCHAR(4),
DELIVERY_TYPE VARCHAR(1),
BILL_PAID VARCHAR(3),
DELIVERY_DATE DATE,
ORDER_STATUS VARCHAR(10) CHECK(ORDER_STATUS IN('PROCESS','PENDING','FULFILLED')),
CONSTRAINT forkey_clientno FOREIGN KEY(CLIENT_NO) REFERENCES CLIENT_MASTER(C_NO),
CONSTRAINT forkey_salesno FOREIGN KEY(SALESMAN_NO) REFERENCES SALESMAN_MASTER(S_NO));

CREATE TABLE SALES_ORDER_DETAILS(
ORDER_NO VARCHAR(4) REFERENCES SALES_ORDER,
PRODUCT_NO VARCHAR(4) REFERENCES PRODUCT_MASTER,
QTY_ORDERED INT,
QTY_DISPATCHED INT,
PRODUCT_RATE INT);