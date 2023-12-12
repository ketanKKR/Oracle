DAY_1

1)Display the structure of an EMP table
-> DESC EMP;

2)Display the structure of DEPT table
->DESC DEPT;

3)Display all the records of EMP table
-> SELECT * FROM EMP;

4)Display all the records of DEPT table
-> SELECT * FROM DEPT;

5)Display only Name of all employees
-> SELECT ENAME FROM EMP;

6)Display Employee’s Name and salary
-> SELECT ENAME,SAL FROM EMP;

7)Display only unique departments (deptno) from EMP table
-> SELECT DISTINCT DEPTNO FROM EMP;

8)Display employees whose name starts with ‘J’
-> SELECT ENAME FROM EMP WHERE ENAME LIKE 'J%';

9)Display all the employees’ Date of Joining (HireDate) and Salary (Sal) 
-> SELECT ENAME,HIREDATE,SAL FROM EMP;

10)Display all clerks (job), from EMP table
-> SELECT * FROM EMP WHERE JOB='CLERK';

11)Display all employees’ name and salary whose salary is more than 2000
-> SELECT ENAME,SAL FROM EMP WHERE SAL>2000;

12)Display all employees who are not in department number (deptno) 30
-> SELECT * FROM EMP WHERE DEPTNO NOT IN 30;

13)Display employees with their empno, ename and mgr (i.e manager’s no)
-> SELECT EMPNO,ENAME,MGR FROM EMP;

14)Display manager’s number, job profile, department number and salary of employees Allen, Adams, Jones and Blake
-> SELECT ENAME,MGR,JOB,DEPTNO,SAL FROM EMP WHERE ENAME IN ('ALLEN','ADAMS','JONES','BLAKE');

15)Display only unique Salary (sal) from EMP table
-> SELECT DISTINCT SAL FROM EMP;

16)Display the location of department number 30
-> SELECT LOC,DEPTNO FROM DEPT WHERE DEPTNO=30;

17)Display the details of the department located in ‘New York’ city
-> SELECT * FROM DEPT WHERE LOC='NEW YORK';

18)Display all the employees according to their names in sorted order 
-> SELECT * FROM EMP ORDER BY ENAME;

19)Display all the employees who are not salesman nor the manager
-> SELECT * FROM EMP WHERE JOB NOT IN ('SALESMAN','MANAGER');

20)Display the details of a clerk who is getting salary more than 1000
-> SELECT * FROM EMP WHERE JOB='CLERK' AND SAL>1000;

------------------------------------------------------------------------------------------------------------

DAY_2

1)Create below given table called “Client_Master” with the constrains and insert minimum 5 records in it.

-> CREATE TABLE Client_Master
(C_No VARCHAR(4) PRIMARY KEY,
Client_Name VARCHAR(25) NOT NULL,
PINCODE NUMBER(6) NOT NULL,
Birth_Date DATE NOT NULL,
Occupation VARCHAR(15) NOT NULL);

a)Client_No must start with the capital letter ‘C’ only
-> ALTER TABLE CLIENT_MASTER ADD CONSTRAINT check_cno CHECK (C_No LIKE 'C%');
b)Pincode must be of exactly 6 digit number
-> ALTER TABLE CLIENT_MASTER ADD CONSTRAINT check_pin CHECK (LENGTH(PINCODE)=6);

INSERT INTO CLIENT_MASTER VALUES ('C001','Kajal Oza',380026,'14-JULY-1987','Manager');
INSERT INTO CLIENT_MASTER VALUES ('C002','Vraj Shah',380058,'20-NOV-1986','CEO');
INSERT INTO CLIENT_MASTER VALUES ('C003','Dhyan Dave',387903,'17-JUNE-1988','Doctor');
INSERT INTO CLIENT_MASTER VALUES ('C004','Mira Vaid',398006,'05-JAN-1976','Professor');
INSERT INTO CLIENT_MASTER VALUES ('C005','Preeti Patel',390040,'28-FEB-1971','CLERK');

2)Create following tables with constraints and records as shown in the example below. Table: Product_Master
-> CREATE TABLE Product_Master
(P_No VARCHAR(4) PRIMARY KEY,
Description VARCHAR(25) NOT NULL,
Profit_Per NUMBER(5) NOT NULL,
Unit VARCHAR(25) NOT NULL,
Qty_Hand NUMBER(5) NOT NULL,
ReOrder NUMBER(5) NOT NULL,
Sell_P NUMBER(5) NOT NULL,
Cost_P NUMBER(5) NOT NULL);

-> ALTER TABLE PRODUCT_MASTER ADD CONSTRAINT check_pno CHECK (P_No LIKE 'P%');

INSERT INTO PRODUCT_MASTER VALUES ('P001','T-Shirt',5,'Piece',200,50,350,250); 
INSERT INTO PRODUCT_MASTER VALUES ('P002','Jeans',6,'Piece',150,40,500,350);
INSERT INTO PRODUCT_MASTER VALUES ('P003','Skirt',6,'Piece',100,50,350,200);
INSERT INTO PRODUCT_MASTER VALUES ('P004','Saree',3,'Piece',100,20,800,600);4

3)Create Table and Insert minimum 10 records in Salesman_Master Table as shown below
-> CREATE TABLE Salesman_Master
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

-> ALTER TABLE SALESMAN_MASTER ADD CONSTRAINT check_sno CHECK (S_No LIKE 'S%');

INSERT INTO SALESMAN_MASTER VALUES ('S001','Aman','3.Dev Appt','Vagh odia','Baroda','','Gujarat',5000,100,50);
INSERT INTO SALESMAN_MASTER VALUES ('S002','Omkar','','','Bhopal','','MP',4500,200,150);
INSERT INTO SALESMAN_MASTER VALUES ('S003','Raj','B-104','Verli','Mumbai','400002','Maharashtra',5500,200,200);
INSERT INTO SALESMAN_MASTER VALUES ('S004','Ashish','1, Smruti','Ghod dol','Surat','','Gujarat',4500,150,100);

4)Create Sales_Order and Sales_Order_Details table as shown below. Insert minimum 10
records in it.
-> CREATE TABLE SALES_ORDER
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

5)Sales_Order_Details: Order_No and Product_No are the composite PK
-> CREATE TABLE SALES_ORDER_DETAILS(
ORDER_NO VARCHAR(4) REFERENCES SALES_ORDER,
PRODUCT_NO VARCHAR(4) REFERENCES PRODUCT_MASTER,
QTY_ORDERED INT,
QTY_DISPATCHED INT,
PRODUCT_RATE INT);
---------------------------------------------------------------------------------------------------------------

DAY_3

1) Create a table called “Clients” from the “Client_Master” table.
->CREATE TABLE CLIENT AS SELECT * FROM CLIENT_MASTER


2) Insert all records of “Client_Master” into “Clients”
->INSERT INTO CLIENT SELECT * FROM CLIENT_MASTER


3) Create table “Products” from “Product_master”
->CREATE TABLE PRODUCTS AS SELECT * FROM PRODUCT_MASTER


4) Copy only selected Product’s information into “Products” table.
->CREATE TABLE PRODUCTSS AS SELECT P_NO, DESCRIPTION, UNIT,QTY_HAND FROM PRODUCTS


5) Create table “Salesman” from Salesman_Master” where “Salesman” table contains
fields: Salesman number, Name, Address1, City, Target_Get, Achieved_Target
->CREATE TABLE SALESMAN AS SELECT S_NO,NAME,ADD1,CITY,TARGET FROM SALESMAN_MASTER


6) Insert all records for the fields in new table from “Salesman_Master” table
->INSERT INTO SALESMAN SELECT S_NO,NAME,ADD1,CITY,TARGET FROM SALESMAN_MASTER


7) Create an “Order_Master” table form “Sales_Order” Tabl
->CREATE TABLE ORDER_MASTER AS SELECT * FROM SALES_ORDER


8) Insert appropriate records in “Order_Master” from Sales_Order” table
->INSERT INTO ORDER_MASTER SELECT  * FROM SALES_ORDER;


9) Create “Order_Detail” table from “Sales_Order_Detail” table
->CREATE TABLE ORDER_DETAIL AS SELECT * FROM SALES_ORDER_DETAILS;



10) Insert appropriate records in “Order_Detail” from Sales_Order_ Detail” table.
->INSERT INTO ORDER_DETAIL SELECT * FROM SALES_ORDER_DETAILS


11) Destroy tables: Client_Master, Product_Master and Salesman_Master table using Truncate
->TRUNCATE TABLE client_master
->TRUNCATE TABLE Product_Master
->TRUNCATE TABLE Salesman_Master

12) Destroy tables: “Sales_Order” and Sales_Order_Details using drop operation
->DROP TABLE  sales_order;





----------------------------------------------------------------------------------------------------------------

DAY_4

1)Remove the product details column from Product_Master Table
-> ALTER TABLE PRODUCT_MASTER DROP COLUMN DESCRIPTION;

2)Remove all Sales_Orders whose QtyOrdered = 1 in “Sales_Order_Detail” table
-> DELETE FROM SALES_ORDER_DETAILS WHERE QTY_ORDERED=1;

3)Modify the OrderStatus to “Fulfilled” where the OrderStatus is “In Process” in Sales_Order Table.
-> UPDATE SALES_ORDER SET ORDER_STATUS='FULFILLED' WHERE ORDER_STATUS='PROCESS';

4)Add column City and State in Client_Master table
-> ALTER TABLE CLIENT_MASTER ADD (CITY VARCHAR(25),STATE VARCHAR(25));

5)Add a Client record for Client Name Ashwini Joshi, city = Banglore
-> INSERT INTO CLIENT_MASTER VALUES ('C006','Ashvini Joshi','390021','01-JUN-1990','CLERK','Banglore','Chennai');

6)Change the city of the client “Ashwini Joshi” from "Bangalore" to "Chennai".
-> UPDATE CLIENT_MASTER SET CITY='Chennai' WHERE CLIENT_NAME='Ashvini Joshi';

7)Change the Cost Price (Cost_P) of a Skirt
-> UPDATE PRODUCT_MASTER SET COST_P='250' WHERE DISCRIPTION='Skirt';

8)Increase the sell price of saree by Rs. 20
-> UPDATE PRODUCT_MASTER SET SELL_P=SELL_P+20 WHERE DISCRIPTION='Saree';

9)Delete all Salesman from Salesman_Master table whose salary is more than 3500
-> DELETE SALESMAN_MASTER WHERE SALARY>3500;

10)Delete all Products from Product_master where Quantity on Hand (Qty_Hand) is less than 50
-> DELETE PRODUCT_MASTER WHERE QTY_HAND<50;

11)Add a column Mobile_No of type Number, in the Client_Master Table
-> ALTER TABLE CLIENT_MASTER ADD MOBILE_NO NUMBER(10);

12)Change the name of Salesman_Master table to "SMan_Mst"
-> ALTER TABLE SALESMAN_MASTER RENAME TO SMAN_MST;

----------------------------------------------------------------------------------------------------------------

DAY_5

1)Display all the clients whose age is more than 25 years but less than 50 yesrs
-> SELECT * FROM CLIENT_MASTER WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,BIRTH_DATE)/12) > 25 AND TRUNC(MONTHS_BETWEEN(SYSDATE,BIRTH_DATE)/12) < 50;

2)Display all the Salesman from Salesman_Master table whose “Sale” is more than his “Target” and “Target” is more than 100
-> SELECT * FROM SALESMAN_MASTER WHERE SALES>TARGET AND TARGET>100;

3)Find the Salesman who are neither from Baroda nor from Surat.
-> SELECT * FROM SALESMAN_MASTER WHERE CITY NOT IN ('Baroda','Surat');

4)Display total number of clients using Client_Master Table.
-> 

5)display the highest salary s salesman is getting.
-> SELECT MAX(SALARY) AS MAXIMUM_SALARY FROM SALESMAN_MASTER;

6)Display all item names in upper case letters only
-> 

7)Display current date and time
-> 

8)Display average target given to the salesman.
-> SELECT AVG(TARGET) AS AVARAGE_TARGET FROM SALESMAN_MASTER;

9)Display the Birth Date (DOB in Student_Master Table) in a new format. (Eg. February 12, 1998)
-> SELECT 

10)Display Date of Joining (DOJ, Faculty_Master) of all faculties in DD/MM/YY format
-> 

11)Display Only Birth Date and Month of all the students from Student_Master Table
-> 

-> CREATE TABLE EMPLOYEE_MASTER
(EMPLOYEE_NO VARCHAR(5) PRIMARY KEY CHECK(EMPLOYEE_NO LIKE 'E%'),
NAME VARCHAR(25),
PINCODE NUMBER(6),
DOB DATE,
ADDRESS VARCHAR(25),
SALARY NUMBER(10),
OCCUPATION VARCHAR(10));

INSERT INTO EMPLOYEE_MASTER VALUES ('E100','Kapil',380036,'14-JULY-1987','Bombay',10000,'Manager');
INSERT INTO EMPLOYEE_MASTER VALUES ('E101','Manish',385670,'20-NOV-1986','Pune',5000,'CEO');
INSERT INTO EMPLOYEE_MASTER VALUES ('E102','Ramesh',387903,'17-JUNE-1988','Goa',25000,'Engineer');
INSERT INTO EMPLOYEE_MASTER VALUES ('E103','Rohan',390009,'15-JAN-1976','Delhi',35000,'Clerk');
INSERT INTO EMPLOYEE_MASTER VALUES ('E104','Raj',398006,'','28-FEB-2000','Abad',30000,'Doctor');

1)List the names of all employee having ‘a’ as the second letter in their names.
-> SELECT NAME FROM EMPLOYEE_MASTER WHERE NAME LIKE '_a%';

2)List the employee whose occupation fist letter is 'M'.
-> SELECT * FROM EMPLOYEE_MASTER WHERE OCCUPATION LIKE 'M%';

3)List the employees who have the second character as a or o.
-> SELECT NAME FROM EMPLOYEE_MASTER WHERE NAME LIKE '_a%' OR NAME LIKE '_o%';

4)List the employee details of the named Rohan, Ramesh and Raj.
-> SELECT * FROM EMPLOYEE_MASTER WHERE NAME IN ('Rohan','Ramesh','Raj');

5)List all employee who stay in 'Banglore' or 'Pune'.
-> SELECT * FROM EMPLOYEE_MASTER WHERE ADDRESS IN ('Banglore','Pune');

6)List the details of employee E102 and E104.
-> SELECT * FROM EMPLOYEE_MASTER WHERE EMPLOYEE_NO IN ('E102','E104');

7)List the details of employee whose salary is greater than 5000 and less than 20000.
-> SELECT * FROM EMPLOYEE_MASTER WHERE SALARY BETWEEN 5001 AND 19999;

8) List the name of employees who are not in the state 'Bombay'.
-> SELECT NAME FROM EMPLOYEE_MASTER WHERE ADDRESS NOT IN 'Bombay';

9)List employee whose salary is less than 1000 and calculate a new incremented salary by 15% as Salary * .15
-> SELECT NAME,SALARY,SALARY*.15+SALARY AS incremented FROM EMPLOYEE_MASTER WHERE SALARY<1000;

10)Count the total number of employees.
-> SELECT COUNT(NAME) AS TOTAL_EMPLOYEE FROM EMPLOYEE_MASTER;

11)Calculate the average salary of all the employees.
-> SELECT AVG(SALARY) AS AVARAGE_SALATY FROM EMPLOYEE_MASTER;

12)Determine the maximum and minimum salary. Rename the output as max_salary and  min_salary respectively.
-> SELECT MAX(SALARY) AS MAX_SALARY,MIN(SALARY) AS MIM_SALARY FROM EMPLOYEE_MASTER;

13)Count the number of employees having salary less than or equal to 15000.
-> SELECT COUNT(NAME) AS EMP_HAV_LESS_OR_EQL_TO_15000 FROM EMPLOYEE_MASTER WHERE SALARY <= 15000;

14)List the details of Employee month wise in DD/MM/YY format.
-> SELECT * FROM EMPLOYEE_MASTER ORDER BY DOB;

15)List the DOB in the format ‘DD-Month-YY’ e.g 12-February-91
-> SELECT TO_CHAR(DOB, 'DD-MONTH-YYYY') AS FORMATED_DATE FROM EMPLOYEE_MASTER;


------------------------------------------------------------------------------------------------------------------
DAY_6

A)Use following tables and solve given queries below it.
    APPLICANT (AID, A_Name, City, B_Date)
    ENTRANCE_TEST (ET_ID, ET_Name, Max_Score)
    ETEST_DETAILS (AID, ETID, ETest_Date, Score)

1) How many applicants have appeared for each test
->SELECT AID,COUNT(*) AS TEST_NO FROM ETEST_DETAIL GROUP BY AID;

2) Display highest score for each test
->SELECT AID,MAX(SCORE) AS HIGHEST_SCORE FROM ETEST_DETAIL GROUP BY AID;

3) Display applicant’s ID who appeared for more than 3 tests
->SELECT AID,COUNT(*) AS TEST_NO FROM ETEST_DETAIL GROUP BY AID HAVING COUNT(AID) > 3;

4) Calculate applicant’s average score across all test they have appeared in
->SELECT ETID,AID,AVG(SCORE) AS AVERAGE_SCORE FROM ETEST_DETAIL GROUP BY AID,ETID;

5) Display number of applicants by city
->SELECT CITY,COUNT(CITY) AS APPLICANT_NO FROM APPLICANT GROUP BY CITY;

6) Display ETID and Average score where average score is more than 50
->SELECT ETID,AVG(SCORE) AS AVERAGE_SCORE FROM ETEST_DETAIL GROUP BY ETID HAVING AVG(SCORE) > 50 ORDER BY(ETID) DESC;

7) Count date wise total entrance test to be held
->SELECT ETEST_DATE,COUNT(ETEST_DATE) AS ETEST_DATE FROM ETEST_DETAIL23 GROUP BY ETEST_DATE;


B) Use the following tables and solve below given queries.
Distributor (Dno, DName, City, Phone)
Item (Item_No, Item_Name, Price, Weight)
Dist_Item (Dno, Item_No, Qty, Date)

1)Display city wise total number of distributors
->SELECT CITY,COUNT(*) AS DISTRIBUTOR_NO FROM DISTRIBUTOR GROUP BY CITY;

2)List distributors’ no by who distributed more than 50 items in month of July
->SELECT D_NO,TO_CHAR(DIST_DATE,'MON'), SUM(QTY) AS QTY FROM DIST_ITEM GROUP BY D_NO,DIST_DATE HAVING TO_CHAR(DIST_DATE,'MON') LIKE 'JUL' AND SUM(QTY) > 50 ORDER BY(D_NO) ASC;

3)List Item_No with more than 800 Qty delivered
->SELECT ITEMNO,SUM(QTY) FROM DIST_ITEM GROUP BY ITEMNO,QTY HAVING SUM(QTY) > 800 ORDER BY(ITEMNO) ASC;

4)List Dno who delivered more than 50 items for each month
->SELECT D_NO,TO_CHAR(DIST_DATE,'MON'), SUM(QTY) AS QTY FROM DIST_ITEM GROUP BY D_NO,TO_CHAR(DIST_DATE,'MON') HAVING SUM(QTY) > 50 ORDER BY(D_NO) ASC;

5)Display item details in descending order of price and ascending order of weight  
->SELECT ITEM_NO, ITEM_NAME, PRICE, WEIGHT FROM ITEM ORDER BY PRICE DESC, WEIGHT;

6)Show all distributors in alphabetical order of City and DName
->SELECT * FROM DISTRIBUTOR ORDER BY CITY, DNAME;

7)Calculate average quantity of items distributed on each day.
->SELECT D_NO,AVG(QTY),TO_CHAR(DIST_DATE,'DD/MM/YYYY') FROM DIST_ITEM GROUP BY D_NO,TO_CHAR(DIST_DATE,'DD/MM/YYYY'),QTY ORDER BY(D_NO);

8)Find the weight wise average price of items.
->SELECT AVG(PRICE) FROM ITEM WHERE WEIGHT = '150GM';
-------------------------------------------------------------------------------------------------------------------

DAY_7

-> CREATE TABLE STUDENT
(ROLLNO VARCHAR(4) PRIMARY KEY,
FNAME VARCHAR(20),
LNAME VARCHAR(20),
DOB DATE);

1) 

----------------------------------------------------------------------------------------------------------------

DAY_8

-> CREATE TABLE APPLICANT
(AID VARCHAR(4) PRIMARY KEY,
ANAME VARCHAR(20),
CITY VARCHAR(20),
BDATE DATE);

INSERT INTO APPLICANT VALUES ('A001','Sanket','Ahmedabad','14-JULY-2002');
INSERT INTO APPLICANT VALUES ('A002','Priya','Surat','21-FEB-2001');
INSERT INTO APPLICANT VALUES ('A003','Vanita','Mumbai','07-JUL-2003');
INSERT INTO APPLICANT VALUES ('A004','Amisha','Rishikesh','11-NOV-2001');
INSERT INTO APPLICANT VALUES ('A005','Krishna','Ahmedabad','07-SEP-2000');

-> CREATE TABLE ENTRANCE_TEST
(ET_ID VARCHAR(4) PRIMARY KEY,
ET_NAME VARCHAR(20),
MAX_SCORE NUMBER(5));

INSERT INTO ENTRANCE_TEST VALUES ('E001','Proggramming',100);
INSERT INTO ENTRANCE_TEST VALUES ('E002','Maths',100);
INSERT INTO ENTRANCE_TEST VALUES ('E003','Web Designing',70);
INSERT INTO ENTRANCE_TEST VALUES ('E004','Web Designing',80);

-> CREATE TABLE ETEST_DETAILS
(AID REFERENCES APPLICANT(AID),
ET_ID REFERENCES ENTRANCE_TEST(ET_ID),
ETEST_DATE DATE,
SCORE NUMBER(5));

INSERT INTO ETEST_DETAILS VALUES ('A001','E004','15-JUN-2022',70);
INSERT INTO ETEST_DETAILS VALUES ('A002','E002','18-JUN-2022',85);
INSERT INTO ETEST_DETAILS VALUES ('A004','E003','19-JUN-2022',90);
INSERT INTO ETEST_DETAILS VALUES ('A003','E001','20-JUN-2022',70);
INSERT INTO ETEST_DETAILS VALUES ('A002','E004','28-JUN-2022',65);
INSERT INTO ETEST_DETAILS VALUES ('A003','E003','18-JUN-2022',87);
INSERT INTO ETEST_DETAILS VALUES ('A002','E001','21-JUN-2022',90);
INSERT INTO ETEST_DETAILS VALUES ('A001','E003','20-JUN-2022',82);
INSERT INTO ETEST_DETAILS VALUES ('A001','E001','15-JUN-2022',95);

1)Display Entrance Test ID (ETID) Wise highest marks scored by any applicant.
-> SELECT ET_ID,MAX(SCORE) FROM ETEST_DETAILS GROUP BY ET_ID;

2)Count ETID wise total number of applicants appeared for the test
-> SELECT ET_ID,COUNT(AID) AS TOTAL_APPLICANTS FROM ETEST_DETAILS GROUP BY ET_ID ORDER BY ET_ID;

3)Find the minimum number of applicants in the entrance test.
-> SELECT COUNT(DISTINCT AID) AS Min_Applicants FROM ETEST_DETAILS; 

4)Count city wise number of applicants registered.
-> SELECT CITY,COUNT(AID) AS APLLICANTS FROM APPLICANT GROUP BY CITY; 

5)Display all the entrance test details for which the applicant “Ohm Patel” appeared.
-> SELECT A.ANAME,E.* FROM ETEST_DETAILS E,APPLICANT A WHERE E.AID='A001' AND A.AID=E.AID;


-> CREATE TABLE DISTRIBUTOR
(DNO VARCHAR(4) PRIMARY KEY,
DName VARCHAR(25),
City VARCHAR(25),
Phone VARCHAR(10));

INSERT INTO Distributor VALUES ('D001', 'Sanket', 'Ahmedabad', '7894586978');
INSERT INTO Distributor VALUES ('D002', 'Harry Potter', 'Hogsward', '9417554357');
INSERT INTO Distributor VALUES ('D003', 'Ron Weasley', 'Hogsmeade', '4082279747');
INSERT INTO Distributor VALUES ('D004', 'Tea Post', 'LJ Campus', '6356660734');
INSERT INTO Distributor VALUES ('D005', 'Salim Babu', 'Sarkhej', '9427953649');
INSERT INTO Distributor VALUES ('D006', 'Harsh', 'Sarkhej', '9427953679');


-> CREATE TABLE ITEMS
(ITEM_NO VARCHAR(4) PRIMARY KEY,
ITEM_NAME VARCHAR(25),
PRICE NUMBER(5),
WEIGHT VARCHAR(10));

INSERT INTO Items VALUES ('I001', 'cold coffee', 20, '200gm');
INSERT INTO Items VALUES ('I002', 'hot coffee', 40, '50ml');
INSERT INTO Items VALUES ('I003', 'burger', 100, '500gm');
INSERT INTO Items VALUES ('I004', 'nachos', 200, '100gm');
INSERT INTO Items VALUES ('I005', 'garlic bread', 250, '150gm');

-> CREATE TABLE DIST_ITEM (
DNO VARCHAR(4) REFERENCES Distributor(DNO),
ITEM_NO VARCHAR(4),
QTY NUMBER(5),
DIST_DATE DATE);

INSERT INTO Dist_Item VALUES ('D001', 'I001', 200, TO_DATE('24-NOV-01'));
INSERT INTO Dist_Item VALUES ('D001', 'I002', 200, TO_DATE('25-JUL-01'));
INSERT INTO Dist_Item VALUES ('D001', 'I003', 200, TO_DATE('26-NOV-01'));
INSERT INTO Dist_Item VALUES ('D001', 'I004', 200, TO_DATE('27-JUL-01'));
INSERT INTO Dist_Item VALUES ('D001', 'I005', 200, TO_DATE('28-NOV-01'));

INSERT INTO Dist_Item VALUES ('D002', 'I001', 200, TO_DATE('24-NOV-01'));
INSERT INTO Dist_Item VALUES ('D002', 'I002', 200, TO_DATE('25-JUL-01'));
INSERT INTO Dist_Item VALUES ('D002', 'I003', 200, TO_DATE('26-NOV-01'));
INSERT INTO Dist_Item VALUES ('D002', 'I004', 200, TO_DATE('27-JUL-01'));
INSERT INTO Dist_Item VALUES ('D002', 'I005', 200, TO_DATE('28-NOV-01'));

INSERT INTO Dist_Item VALUES ('D003', 'I001', 200, TO_DATE('24-NOV-01'));
INSERT INTO Dist_Item VALUES ('D003', 'I002', 200, TO_DATE('25-JUL-01'));
INSERT INTO Dist_Item VALUES ('D003', 'I003', 200, TO_DATE('26-NOV-01'));
INSERT INTO Dist_Item VALUES ('D003', 'I004', 200, TO_DATE('27-JUL-01'));
INSERT INTO Dist_Item VALUES ('D003', 'I005', 200, TO_DATE('28-NOV-01'));

INSERT INTO Dist_Item VALUES ('D004', 'I001', 200, TO_DATE('24-NOV-01'));
INSERT INTO Dist_Item VALUES ('D004', 'I002', 200, TO_DATE('25-JUL-01'));
INSERT INTO Dist_Item VALUES ('D004', 'I003', 200, TO_DATE('26-NOV-01'));
INSERT INTO Dist_Item VALUES ('D004', 'I004', 200, TO_DATE('27-JUL-01'));
INSERT INTO Dist_Item VALUES ('D004', 'I005', 200, TO_DATE('28-NOV-01'));

INSERT INTO Dist_Item VALUES ('D005', 'I001', 200, TO_DATE('24-JUL-01'));
INSERT INTO Dist_Item VALUES ('D005', 'I002', 200, TO_DATE('25-NOV-01'));
INSERT INTO Dist_Item VALUES ('D005', 'I003', 200, TO_DATE('26-JUL-01'));
INSERT INTO Dist_Item VALUES ('D005', 'I004', 200, TO_DATE('27-NOV-01'));
INSERT INTO Dist_Item VALUES ('D005', 'I005', 200, TO_DATE('28-JUL-01'));

1) Display all the distributor’s name who supplies Item_No 5
-> SELECT D.DNAME,I.ITEM_NO FROM DISTRIBUTOR D,DIST_ITEM I WHERE D.DNO=I.DNO AND I.ITEM_NO='I005';

2) Display the item which is distributed maximum time
-> SELECT I.ITEM_NAME,COUNT(D.ITEM_NO) AS TIMES_DISTRIBUTED FROM ITEMS I,DIST_ITEM D WHERE I.ITEM_NO=D.ITEM_NO GROUP BY I.ITEM_NAME;

3) Display all the items that are distributed by the distributor “Dev Shah”
-> SELECT D.DNAME,I.ITEM_NAME FROM DISTRIBUTOR D,ITEMS I,DIST_ITEM DI WHERE D.DNAME='Harry Potter' AND I.ITEM_NO=DI.ITEM_NO AND DI.DNO='D002';

4) Display the Item_Name and Quantity that are received in month of July in 2021
-> SELECT I.ITEM_NAME,D.QTY,D.DIST_DATE FROM ITEMS I,DIST_ITEM D WHERE TO_CHAR(DIST_DATE, 'MON')='JUL' AND I.ITEM_NO=D.ITEM_NO;

5) Display all the items whose price is less than 1000 and received Qty=10
-> SELECT DISTINCT I.ITEM_NAME,I.PRICE,D.QTY FROM ITEMS I,DIST_ITEM D WHERE I.PRICE<1000 AND D.QTY=10 AND I.ITEM_NO=D.ITEM_NO;

------------------------------------------------------------------------------------------------------------------------------------------

DAY_9

-> CREATE TABLE BRANCH
(BNAME VARCHAR(10) PRIMARY KEY,
CITY VARCHAR(10));

INSERT INTO BRANCH VALUES('Nikol','Ahmedabad');
INSERT INTO BRANCH VALUES('yogichowk','Surat');
INSERT INTO BRANCH VALUES('Verli','Mumbai');
INSERT INTO BRANCH VALUES('Sarkhej','Ahmedabad');
INSERT INTO BRANCH VALUES('Varachha','surat');

-> CREATE TABLE CUSTOMER
(CUST_NO VARCHAR(5) PRIMARY KEY,
CNAME VARCHAR(10),
CITY VARCHAR(10));

INSERT INTO CUSTOMER VALUES('C001','Manav','Ahmedabad');
INSERT INTO CUSTOMER VALUES('C002','Harry','Surat');
INSERT INTO CUSTOMER VALUES('C003','Ron','Ahmedabad');
INSERT INTO CUSTOMER VALUES('C004','Priya','Mumbai');
INSERT INTO CUSTOMER VALUES('C005','Eva','Mumbai');

-> CREATE TABLE DEPOSITE
(ACCNO VARCHAR(5) PRIMARY KEY,
CUST_NO VARCHAR(5) REFERENCES CUSTOMER(CUST_NO),
BNAME VARCHAR(10) REFERENCES BRANCH(BNAME),
AMOUNT NUMBER(6),
ADATE DATE);

INSERT INTO DEPOSITE VALUES('AC01','C001','Nikol',50000,'22-jul-2022');
INSERT INTO DEPOSITE VALUES('AC02','C002','Varachha',10000,'21-feb-2022');
INSERT INTO DEPOSITE VALUES('AC03','C003','Verli',70000,'21-jan-2022');
INSERT INTO DEPOSITE VALUES('AC04','C004','Nikol',25000,'09-feb-2021');
INSERT INTO DEPOSITE VALUES('AC05','C005','yogichowk',10000,'15-feb-2021');


-> CREATE TABLE BORROW(LOANNO VARCHAR(5) PRIMARY KEY,
CUST_NO VARCHAR(5) REFERENCES CUSTOMER(CUST_NO),
BNAME VARCHAR(10) REFERENCES BRANCH(BNAME),
AMOUNT NUMBER(10)
);

INSERT INTO BORROW VALUES('L001','C001','Nikol',30000);
INSERT INTO BORROW VALUES('L002','C002','Varachha',25000);
INSERT INTO BORROW VALUES('L003','C003','Verli',15000);

1) Get the details of the customers 'ron'
-> SELECT C.*,D.BNAME,D.AMOUNT DEPOSITED,D.ADATE,B.BNAME,B.AMOUNT AS BORROWED FROM CUSTOMER C,DEPOSITE D,BORROW B WHERE C.CNAME='Ron' AND C.CUST_NO=D.CUST_NO AND C.CUST_NO=B.CUST_NO;
 
2) Give name of customer who are borrowers and depositors and having living city  Ahmedabad
-> SELECT C.*,D.AMOUNT DEPOSITED,B.AMOUNT AS BORROWED FROM CUSTOMER C,DEPOSITE D,BORROW B WHERE C.CUST_NO=D.CUST_NO AND C.CUST_NO=B.CUST_NO AND C.CITY='Ahmedabad';

3) Give city as their city name of customers having same living branch
-> SELECT C.*,B.BNAME FROM CUSTOMER C,BRANCH B WHERE B.NAME=C.BNAME;

4) Write a query to display the Customer name with his Deposited Amount, deposited  date and branch name in which he has deposited.
-> SELECT C.*,D.BNAME,D.AMOUNT DEPOSITED,D.ADATE FROM CUSTOMER C,DEPOSITE D WHERE C.CUST_NO=D.CUST_NO;

5) Create a unique listing of all customers who have taken loan from 'Ahmedabad'
-> SELECT C.*,B.BNAME,B.AMOUNT FROM CUSTOMER C,BORROW B,BRANCH BR WHERE B.BNAME=BR.BNAME AND C.CUST_NO=B.CUST_NO AND BR.CITY='Ahmedabad';

6) Display all account details of Ahmedabad branch
-> SELECT C.*,D.BNAME,D.AMOUNT DEPOSITED,D.ADATE,B.BNAME,B.AMOUNT AS BORROWED FROM CUSTOMER C,DEPOSITE D,BORROW B,BRANCH BR WHERE C.CUST_NO=D.CUST_NO AND C.CUST_NO=B.CUST_NO AND BR.BNAME='Ahmedabad';

7) Display customer’s details who have deposited less than 10,000 and borrowed  more than 50,000
-> SELECT C.*,D.BNAME,D.AMOUNT DEPOSITED,D.ADATE,B.BNAME,B.AMOUNT AS BORROWED FROM CUSTOMER C,DEPOSITE D,BORROW B WHERE C.CUST_NO=D.CUST_NO AND C.CUST_NO=B.CUST_NO AND B.AMOUNT>50000 AND D.AMOUNT<10000;

8) Display all account details where there is any deposited after the year 2020.
-> SELECT C.*,D.BNAME,D.AMOUNT DEPOSITED,D.ADATE FROM CUSTOMER C,DEPOSITE D WHERE C.CUST_NO=D.CUST_NO AND D.ADATE>'31-DEC-2020';


-------------------------------------------------------------------------------------------------------------------------------

DAY_10

-> CREATE TABLE WORKER
(W_ID VARCHAR(4) PRIMARY KEY,
NAME VARCHAR(10),
WPH  NUMBER(10));

INSERT INTO WORKER VALUES('W001','sanket',500);
INSERT INTO WORKER VALUES('W002','harsh',300);
INSERT INTO WORKER VALUES('W003','manav',200);
INSERT INTO WORKER VALUES('W004','harry',500);
INSERT INTO WORKER VALUES('W005','coffee',800);
INSERT INTO WORKER VALUES('W006','Damar',800);
INSERT INTO WORKER VALUES('W007','Ketan',900);


-> CREATE TABLE JOB
(JOB_ID VARCHAR(4) PRIMARY KEY,
JOB_TYPE VARCHAR(10));

INSERT INTO JOB VALUES('J001','manager');
INSERT INTO JOB VALUES('J002','clerk');

-> CREATE TABLE ASSIGNED
(W_ID VARCHAR(4) REFERENCES WORKER(W_ID),
J_ID VARCHAR(4) REFERENCES JOB(JOB_ID),
START_DATE DATE,
STATUS VARCHAR(20),
TOTAL_HRS NUMBER(10));

INSERT INTO ASSIGNED VALUES('W001','J001','11-feb-2020','Done',10);
INSERT INTO ASSIGNED VALUES('W002','J001','12-feb-2020','Done',10);
INSERT INTO ASSIGNED VALUES('W003','J001','13-feb-2020','Pending',12);
INSERT INTO ASSIGNED VALUES('W004','J002','14-feb-2020','in progress',7);
INSERT INTO ASSIGNED VALUES('W005','J002','15-feb-2020','Pending',6);
INSERT INTO ASSIGNED VALUES('W006','J002','15-feb-2020','Done',6);
INSERT INTO ASSIGNED VALUES('W007','J001','15-feb-2020','Done',6);
INSERT INTO ASSIGNED VALUES('W007','J002','15-feb-2020','Done',6);

1) Display all the workers’ Id assigned for Job 1 and 2 both (J_Id =1 and J_Id=2)
-> SELECT W_ID FROM ASSIGNED WHERE J_ID IN ('J001','J002') GROUP BY W_ID HAVING COUNT(J_Id)=2;

2) List the workers who are working for J_Id =1 and not for J_Id = 2
-> SELECT W.*,A.J_ID FROM WORKER W,ASSIGNED A WHERE A.J_ID='J001' AND W.W_ID=A.W_ID;

3) Display the workers Id who are working for more than 6 hours and status is pending. And Union them all with the worker’s Id who are working for less than 6 hours and status is completed
-> SELECT W_ID FROM ASSIGNED WHERE TOTAL_HRS>6 AND STATUS='Pending' UNION SELECT W_ID FROM ASSIGNED WHERE TOTAL_HRS<6 AND STATUS='Done';


-> CREATE TABLE FY
(ENROL_NO VARCHAR(10) PRIMARY KEY,
NAME VARCHAR(10),
SPI NUMBER(5,2));

INSERT INTO FY VALUES('FE001','Manav',6.5);
INSERT INTO FY VALUES('FE002','Sanket',5.5);
INSERT INTO FY VALUES('FE003','Harsh',4.5);
INSERT INTO FY VALUES('FE004','Ron',7.9);
INSERT INTO FY VALUES('FE005','salim',8);
INSERT INTO FY VALUES('FE006','Ketan',8);

-> CREATE TABLE SY
(ENROL_NO VARCHAR(10) PRIMARY KEY,
NAME VARCHAR(10),
SPI NUMBER(5,2));

INSERT INTO SY VALUES('SE001','Coffee',6.5);
INSERT INTO SY VALUES('SE002','Harry',5.5);
INSERT INTO SY VALUES('SE003','Damar',4.5);
INSERT INTO SY VALUES('SE004','Ron',7.9);
INSERT INTO SY VALUES('SE005','salim',3);
INSERT INTO SY VALUES('SE006','Nilesh',7.9);

1)Display the name of the student who is ranker in ‘FY’ or ‘SY’
-> SELECT NAME,SPI FROM FY WHERE SPI=(SELECT MAX(SPI) FROM FY) UNION SELECT NAME,SPI FROM SY WHERE SPI=(SELECT MAX(SPI) FROM SY);

2)Display the name of the student who is ranker in ‘FY’ or ‘SY’ including duplicate data
-> SELECT NAME,SPI FROM FY WHERE SPI=(SELECT MAX(SPI) FROM FY) UNION SELECT NAME,SPI FROM SY WHERE SPI=(SELECT MAX(SPI) FROM SY);

3) Display the name of the students who is ranker in ‘FY’ or ‘SY’ and having SPI more than 7
-> SELECT NAME,SPI FROM FY WHERE SPI=(SELECT MAX(SPI) FROM FY) AND SPI>7 UNION SELECT NAME,SPI FROM SY WHERE SPI=(SELECT MAX(SPI) FROM SY) AND SPI>7;

4)Display the name of the student who is ranker in both FY and SY
-> WITH CombinedData AS (SELECT NAME, SPI FROM FY UNION ALL SELECT NAME, SPI FROM SY) SELECT NAME,SPI FROM CombinedData WHERE SPI = (SELECT MAX(SPI) FROM CombinedData);

5)Display the name of the student who is ranker in FY but not in SY
-> SELECT * FROM FY WHERE SPI = (SELECT MAX(SPI) FROM FY) MINUS SELECT * FROM SY WHERE SPI = (SELECT MAX(SPI) FROM SY);

6) Display the name of the student who is ranker in SY but not in FY
-> SELECT * FROM SY WHERE SPI = (SELECT MAX(SPI) FROM SY) MINUS SELECT * FROM FY WHERE SPI = (SELECT MAX(SPI) FROM FY);

----------------------------------------------------------------------------------------------------------------------------------------------------

DAY_11

USE THE EMP AND DEPT TABLES TO PERFORM FOLLOWING QUERIES.

1)Create a view called Emp_View from Employee table.
-> CREATE VIEW Emp_View AS SELECT * FROM EMP;

2)Renaming the columns of Emp view.
-> 

3)Select Employee Name where department is 'Accounting' or 'Research'.
-> SELECT ENAME,DNAME FROM EMP_VIEW E,DEPT_VIEW D WHERE E.DEPTNO=D.DEPTNO AND D.DNAME IN ('ACCOUNTING','RESEARCH');

4)Update Name='Vaishali' where name is 'Allen'.
-> UPDATE EMP_VIEW SET ENAME='Vaishali' WHERE ENAME='ALLEN';

5)Delete a record where name is ‘Vaishali’.
-> DELETE EMP_VIEW WHERE ENAME='Vaishali';

6)Remove a view Emp from database.
-> DROP VIEW EMP_VIEW;


-> CREATE TABLE BRANCH1
(BNO NUMBER(5),
BNAME VARCHAR(20));

-> CREATE TABLE ADDRESS
(AANO NUMBER(5) PRIMARY KEY,
BNO NUMBER(5),
TYPE VARCHAR(1),
ADD1 VARCHAR(25),
ADD2 VARCHAR(25),
CITY VARCHAR(25),
STATE VARCHAR(25),
PINCODE NUMBER(6));

1)Create bno in Branch as a primary key, which is the reference key in address table
-> ALTER TABLE BRANCH1 ADD CONSTRAINT Pkey_BRANCH1 PRIMARY KEY(BNO);
-> ALTER TABLE ADDRESS ADD CONSTRAINT Fkey_BRANCH1 FOREIGN KEY(BNO) REFERENCES BRANCH1(BNO);

2)Add constraint for type field will have value ‘H’ or ‘B’ (H-Head, B-Branch)
-> ALTER TABLE ADDRESS ADD CONSTRAINT CHECK_BRANCH_TYPE CHECK(TYPE LIKE 'H' OR TYPE LIKE 'B');

3)Create a view Branch_Master from Brach and Address Table.
-> 

4)Update Pincode=400079 where bno=102. 3.
-> UPDATE ADDRESS SET PINCODE=400076 WHERE BNO=102;

5)Delete records where bno=102;
-> DELETE ADDRESS WHERE BNO=102;

6)Remove a view Branch_Master from database
-> DROP VIEW BRANCH_MASTER;

---------------------------------------------------------------------------------------------------

DAY_12

Emloyee (EmpNo, Ename, Salary, Designation)
Dept (EmpNo, DeptNo) 

1)Display all rows for salary greater than 5000.
-> SELECT * FROM EMP WHERE SAL>5000;

2)Display the deptno for the name ‘shyam’.
-> SELECT DEPTNO FROM EMP WHERE ENAME='Shyam';

3)Add a new column DeptName in Dept table.
-> ALTER TABLE DEPT ADD DEPT_NAME VARCHAR(15);

4)Change the designation of ename=’ram’ from ‘clerk’ to ‘senior clerk’.
-> UPDATE EMP SET JOB='SENIOR CLERK' WHERE ENAME='Ram';

5)Find the total salary of all the rows.
-> SELECT SUM(SAL) AS TOTAL_SALARY FROM EMP;

6)Display EmpNo, Ename, DeptNo, DeptName.
-> SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DEPT_NAME FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO;

7)Drop the table Employee.
-> DROP TABLE EMP;


Student (StuNo,sname,marks,college)
Course (StuNo,CourseId)

1)Display all rows for student greater than 80.
-> SELECT S.*,C.PASS_MARKS FROM STUDENT S,COURSE C WHERE PASS_MARKS>80 AND S.ROLLNO=C.ROLL_NO;

2)Display the CouseId for the name ‘shyam’.
-> 

3)Add a new column CollegeName in Course table.
-> ALTER TABLE COURSE ADD COLLAGENAME VARCHAR(25);

4)Change the college of sname=’ram’ from ‘LJ’ to ‘new LJ’.
-> 

5)Find the total marks of all the rows.
-> SELECT SUM(PASS_MARKS) AS TOTAL_MARKS FROM COURSE;

6)Display StuNo,sname,CoursId,CourseName.
-> SELECT S.ROLLNO,S.FNAME || ' ' || S.LNAME AS SNAME,C.COURSE_NO,COURSE_NAME FROM STUDENT S,COURSE C WHERE S.ROLLNO=C.ROLL_NO;


-----------------------------------------------------------------------------------------------------------------------------------------------------

DAY_13


1)Print a static string “Hello Every One…!” using an anonymous PLSQL block and execute  it.
BEGIN
   DBMS_OUTPUT.PUT('Hello Every One…!');
END;
/

2)Write a PLSQL block to display a greeting message like: “Hi!! Today is 3rd November 2021, Friday.
BEGIN
   DBMS_OUTPUT.PUT_LINE('Hi!! Today is 3rd November 2021, Friday');
END;
/


3)Declare a string variable to store student’s name, define three integer variables to store marks of 3 subjects (out of 50) of that student. Write a PLSQL code to calculate total of  all three subjects and print the result in percentage.
DECLARE
    SNAME VARCHAR(25);
    SUBJECT1 INTEGER;
    SUBJECT2 INTEGER;
    SUBJECT3 INTEGER;
    TOTAL_MARKS NUMBER(10);
    PERCENTAGE NUMBER(10);
BEGIN
    SNAME:='&SANME';
    SUBJECT1:=&SUBJECT1;
    SUBJECT2:=&SUBJECT2;
    SUBJECT3:=&SUBJECT3;
    TOTAL_MARKS := SUBJECT1+SUBJECT2+SUBJECT3;
    PERCENTAGE := TOTAL_MARKS/3;

    DBMS_OUTPUT.PUT_LINE('STUDENT NAME: '||SNAME);
    DBMS_OUTPUT.PUT_LINE('SUBJECT 1: '||SUBJECT1);
    DBMS_OUTPUT.PUT_LINE('SUBJECT 2: '||SUBJECT2);
    DBMS_OUTPUT.PUT_LINE('SUBJECT 3: '||SUBJECT3);
    DBMS_OUTPUT.PUT_LINE('TOTAL MARKS: '||TOTAL_MARKS);
    DBMS_OUTPUT.PUT_LINE('PERCENTAGE: '||PERCENTAGE);
END;
/

DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('STUDENT NAME SUBJECT1 SUBJECT2 SUBJECT3 TOTAL_MARKS');
    DBMS_OUTPUT.PUT_LINE('============================================================');
    DBMS_OUTPUT.PUT_LINE(SNAME || SUBJECT1 || SUBJECT2 || SUBJECT3 || TOTAL_MARKS);



4)Write a program to divide 2 numbers and if the denominator if 0 then handle the exception.
DECLARE
    NUM1 NUMBER(5);
    NUM2 NUMBER(5);
    ANS NUMBER(5);
BEGIN
    NUM1 := &NUM1;
    NUM2 := &NUM2;
    ANS := NUM1/NUM2;

    DBMS_OUTPUT.PUT_LINE('ANSWER: '||ANS);
END;
/



5)Write a user defined exception for above program 3 where if marks are less than 0 then appropriate error message must be shown as exception.
DECLARE
    SNAME VARCHAR(25);
    SUBJECT1 INTEGER;
    SUBJECT2 INTEGER;
    SUBJECT3 INTEGER;
    TOTAL_MARKS NUMBER(10);
    PERCENTAGE NUMBER(10);
    MARKS_CHECK EXCEPTION;
BEGIN
    SNAME:='&SANME';
    SUBJECT1:=&SUBJECT1;
    SUBJECT2:=&SUBJECT2;
    SUBJECT3:=&SUBJECT3;
    TOTAL_MARKS := SUBJECT1+SUBJECT2+SUBJECT3;
    PERCENTAGE := TOTAL_MARKS/3;

    IF SUBJECT1<0 OR SUBJECT2<0 OR SUBJECT3<0 THEN
        RAISE MARKS_CHECK;
    ELSE
        DBMS_OUTPUT.PUT_LINE('STUDENT NAME: '||SNAME);
        DBMS_OUTPUT.PUT_LINE('SUBJECT 1: '||SUBJECT1);
        DBMS_OUTPUT.PUT_LINE('SUBJECT 2: '||SUBJECT2);
        DBMS_OUTPUT.PUT_LINE('SUBJECT 3: '||SUBJECT3);
        DBMS_OUTPUT.PUT_LINE('TOTAL MARKS: '||TOTAL_MARKS);
        DBMS_OUTPUT.PUT_LINE('PERCENTAGE: '||PERCENTAGE);
    END IF;

    EXCEPTION
        WHEN MARKS_CHECK THEN
            DBMS_OUTPUT.PUT_LINE('Please Enter a Valid Marks!');         
END;
/


6)Write a PLSQL block to find the largest of three numbers
DECLARE
    NUM1 NUMBER(5);
    NUM2 NUMBER(5);
    NUM3 NUMBER(5);
BEGIN
    NUM1 := &NUM1;
    NUM2 := &NUM2;
    NUM3 := &NUM3;

    IF NUM1>NUM2 AND NUM1>NUM3 THEN
        DBMS_OUTPUT.PUT_LINE('LARGEST NUMBER IS: '||NUM1);
    ELSIF NUM2>NUM1 AND NUM2>NUM3 THEN
        DBMS_OUTPUT.PUT_LINE('LARGEST NUMBER IS: '||NUM2);
    ELSE
        DBMS_OUTPUT.PUT_LINE('LARGEST NUMBER IS: '||NUM3);
    END IF;
END;
/


------------------------------------------------------------------------------------------------------------------

DAY_14

1) Write a PLSQL block to print all the prime numbers between 1 to 50

DECLARE
    PRIME NUMBER(2);
    I NUMBER;
BEGIN
    PRIME := 2;
    I:=1;

    FOR I IN 2..50/2
    LOOP
        IF MOD(PRIME,2)=0 THEN
            DBMS_OUTPUT.PUT_LINE('');
        ELSE
            DBMS_OUTPUT.PUT_LINE(PRIME);
        END IF;
    PRIME := PRIME+1;
    END LOOP;
END;
/


2) Display all the integer numbers between 4 to 40 which are divisible by 3 using “Exit When” statement.

DECLARE
    NUM NUMBER(2);
BEGIN
    NUM := 4;

    LOOP
        IF MOD(NUM, 3) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(NUM);
        END IF;
        NUM := NUM+1;
    EXIT WHEN NUM>40;
    END LOOP;
END;
/

3) Implement a PL/SQL Block which takes input number of rows and displays triangle.
*
**
***
****
*****

DECLARE
    COLS NUMBER(1);
    ROWS NUMBER(1);
BEGIN
    COLS := 0;
    ROWS := 0;

    LOOP
        COLS := 0;
        LOOP
            DBMS_OUTPUT.PUT('* ');
            COLS := COLS+1;
        EXIT WHEN COLS>ROWS;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        ROWS := ROWS+1;
    EXIT WHEN ROWS=6;
    END LOOP;
END;
/


4) Write a program to divide 2 numbers and if the denominator if 0 then handle the exception.

DECLARE
    NO1 NUMBER;
    NO2 NUMBER;
    ANSWER NUMBER;
BEGIN 
    NO1 := &NOA;
    NO2 := &NOB;
    DBMS_OUTPUT.PUT_LINE('THE NO1 IS ' || NO1);
        DBMS_OUTPUT.PUT_LINE('THE NO2 IS ' || NO2);
    IF NO2!=0 THEN
        ANSWER := NO1/NO2;
        DBMS_OUTPUT.PUT_LINE('THE DIVISION IS ' || ANSWER);
    ELSE
        DBMS_OUTPUT.PUT_LINE('THE DIVISION IS NOT POSSIBLE');
    END IF;
END;
/


5) Write a user defined exception for above program 3 where if marks are less than 0 then  appropriate error message must be shown as exception.

DECLARE
    NO1 NUMBER;
    NO2 NUMBER;
    ANSWER NUMBER;
    NO_DIVIDE_ZERO EXCEPTION;
BEGIN
    NO1 := &NOA;
    NO2 := &NOB;
    DBMS_OUTPUT.PUT_LINE('THE NO1 IS ' || NO1);
    DBMS_OUTPUT.PUT_LINE('THE NO2 IS ' || NO2);
    IF NO2!=0 THEN
        ANSWER := NO1/NO2;
        DBMS_OUTPUT.PUT_LINE('THE DIVISION IS ' || ANSWER);
    ELSIF NO2=0 THEN
        RAISE NO_DIVIDE_ZERO;
    END IF;
EXCEPTION
    WHEN NO_DIVIDE_ZERO THEN
    DBMS_OUTPUT.PUT_LINE('PLEASE INPUT VALID DENOMINATOR');
END;
/


6) Write a PLSQL block to find the largest of three numbers

DECLARE
    A NUMBER;
    B NUMBER;
    C NUMBER;
BEGIN
    A := &NOA;
    B := &NOB;
    C := &NOC;
    IF A > B AND A > C THEN
        DBMS_OUTPUT.PUT_LINE('A IS THE LARGEST NUMBER ' || A);
    ELSIF B > A AND B > C THEN
        DBMS_OUTPUT.PUT_LINE('B IS THE LARGEST NUMBER ' || B);
    ELSE
        DBMS_OUTPUT.PUT_LINE('C IS THE LARGEST NUMBER ' || C);
    END IF;
END;
/


----------------------------------------------------------------------------------------------

DAY_14

1) Write a PLSQL block to print all the prime numbers between 1 to 50

DECLARE
    I NUMBER;
    COUNTER NUMBER;
    K NUMBER;
    N NUMBER;
BEGIN
    FOR N IN 1 .. 100
    LOOP
        COUNTER := 0;
        K := N/2;
        FOR I IN 2..K
        LOOP
            IF(MOD(N, I) = 0) THEN
                COUNTER := 1;
            END IF;
        END LOOP;
        IF(COUNTER = 0) THEN
            DBMS_OUTPUT.PUT_LINE(N || ' IS A PRIME NO');
        END IF;
    END LOOP;
END;
/

2) Display all the integer numbers between 4 to 40 which are divisible by 3 using “Exit When” statement.

DECLARE
    I NUMBER;
    J NUMBER;
BEGIN
    I := 4;
    LOOP
        I := I + 1;
        IF (I/3) THEN
            DBMS_OUTPUT.PUT_LINE(I);
        END IF;
    EXIT WHEN I <= 40; 
    END LOOP;
END;
/

3) Implement a PL/SQL Block which takes input number of rows and displays triangle.
*
**
***
****
*****

DECLARE
    COLS NUMBER(1);
    ROWS NUMBER(1);
BEGIN
    COLS := 0;
    ROWS := 0;

    LOOP
        COLS := 0;
        LOOP
            DBMS_OUTPUT.PUT('* ');
            COLS := COLS+1;
        EXIT WHEN COLS>ROWS;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        ROWS := ROWS+1;
    EXIT WHEN ROWS=6;
    END LOOP;
END;
/

-------------------------------------------------------------------------------------

DAY_15

1) Use following tables and write below given PL/SQL blocks.

PRODUCTS (Prod_ID, Prod_Name, Supplier_ID, Cat_ID, Unit, Price)
ORDER_DETAILS (OrderDetail_ID, Order_ID, Prod_Id, Quantity)

1. Write a PLSQL block to display total number of products ordered in Order_ID = 3
DECLARE
    QTY ORDER_DETAIL.QUANTITY%TYPE;
BEGIN
    SELECT QUANTITY INTO QTY FROM ORDER_DETAIL WHERE ORDEAR_ID = 003;
    DBMS_OUTPUT.PUT_LINE(QTY);
END;


2. Write a PLSQL block to update the price (actual price + 5) of product with Id = 2
DECLARE
    PRI PRODUCT.PRICE%TYPE;
BEGIN 
    UPDATE PRODUCT SET PRICE = 45 WHERE PROD_ID = 'P002';
    SELECT PRICE INTO PRI FROM PRODUCT WHERE PROD_ID = 'P002';
    DBMS_OUTPUT.PUT_LINE(PRI);
END;


3. WRITE A PLSQL BLOCK TO DELETE THE PRODUCTS OF CAT_ID = 3
BEGIN
    DELETE FROM PRODUCT WHERE CAT_ID = 03;
END;


4. Write a PLSQL block to insert any product whose cat_id = 3
BEGIN
    INSERT INTO PRODUCT VALUES();
END;

5. Write a PLSQL block to display Supplier_Id and their total number of products they supply
DECLARE 
    CURSOR CSUP IS SELECT * FROM PRODUCT;
    CURSOR CORDER(VARPID ORDER_DETAIL.PROD_ID%TYPE) IS SELECT * FROM ORDER_DETAIL WHERE PROD_ID = VARPID;
BEGIN
    FOR VARCSUP IN CSUP
    LOOP
        DBMS_OUTPUT.PUT_LINE('SUPPLIER ID: ' || VARCSUP.SUPPLIER_ID);
        DBMS_OUTPUT.PUT('PRODUCT ID: ' || VARCSUP.PROD_ID || '-->');
            FOR VARCORDER IN CORDER(VARCSUP.PROD_ID)
            LOOP
                DBMS_OUTPUT.PUT_LINE('QUANTITY - ' || VARCORDER.QUANTITY);
            END LOOP;
    END LOOP;
END;

--------------------------------------------------------------------------------------------------

DAY_16

(I)
Create a table Student (R_No, Name, Sub1, Sub2, Sub3, Total, Grade) Insert 10 records in the above table where each subject carries maximum 100 marks. Don’t enter the total and grade manually.
CREATE TABLE STUDENT(R_NO NUMBER(5),NAME VARCHAR(10),SUB1 NUMBER(3),SUB2 NUMBER(3),SUB3 NUMBER(3));

INSERT INTO STUDENT VALUES(01,'MANAV',50,59,70);
INSERT INTO STUDENT VALUES(02,'HARSH',79,59,70);
INSERT INTO STUDENT VALUES(03,'AKSHY',89,25,30);
INSERT INTO STUDENT VALUES(04,'SIMMI',50,87,40);
INSERT INTO STUDENT VALUES(05,'SANKET',50,22,12);
INSERT INTO STUDENT VALUES(06,'DIYA',50,50,50);
INSERT INTO STUDENT VALUES(07,'DISHA',40,45,45);
INSERT INTO STUDENT VALUES(08,'VIKAS',12,22,22);
INSERT INTO STUDENT VALUES(09,'VANITA',69,96,40);
INSERT INTO STUDENT VALUES(10,'AMISHA',49,59,59);

1. Write a PLSQL block to calculate and update the Total for each and every student.
DECLARE
    CURSOR CSTUD IS SELECT * FROM STUDENT;
    TOT NUMBER;
BEGIN
    FOR VARCSTUD IN CSTUD
    LOOP
        TOT := 0;
        DBMS_OUTPUT.PUT_LINE('ROLL_NO - ' || VARCSTUD.R_NO);
        DBMS_OUTPUT.PUT_LINE('SUB1 - ' || VARCSTUD.SUB1);
        DBMS_OUTPUT.PUT_LINE('SUB2 - ' || VARCSTUD.SUB2);
        DBMS_OUTPUT.PUT_LINE('SUB3 - ' || VARCSTUD.SUB3);
        TOT := TOT + VARCSTUD.SUB1 + VARCSTUD.SUB2 + VARCSTUD.SUB3;
        DBMS_OUTPUT.PUT_LINE('TOTAL MARKS - ' || TOT);
        DBMS_OUTPUT.PUT_LINE('-------------------');
        UPDATE STUDENT SET TOTAL = TOT WHERE R_NO = VARCSTUD.R_NO;
    END LOOP;
END;


2. Calculate the grade of all students, based to total (>70 AA, >60 A, >50 B, >35 C, else Fail)
declare 
    cursor cstud is select * from student;
    grd varchar(5);
begin
    for varcstud in cstud
    loop
        dbms_output.put_line('total - ' || varcstud.total);
        if varcstud.total > 280 then
            grd := 'AA';
        elsif varcstud.total > 250 then
            grd := 'A';
        elsif varcstud.total > 200 then
            grd := 'B';
        elsif varcstud.total > 150 then
            grd := 'C';
        else
            grd := 'FAIL';
        end if; 
        update student set grade = grd where r_no = varcstud.r_no;
    end loop;
end;


3. Write a Cursor to find the first 3 rankers based on the total marks.
DECLARE
    NAME STUDENT.NAME%TYPE;
    MARKS STUDENT.TOTAL%TYPE;
    GRADE STUDENT.GRADE%TYPE;
    CURSOR V1 IS SELECT NAME, TOTAL, GRADE FROM STUDENT ORDER BY TOTAL DESC;
BEGIN
    OPEN V1;
    LOOP
        FETCH V1 INTO NAME, MARKS, GRADE;
        EXIT WHEN V1%ROWCOUNT > 4;
        DBMS_OUTPUT.PUT_LINE(LPAD(NAME,10)||'  '||LPAD(MARKS,5)||'  '||LPAD(GRADE,5));
    END LOOP;
    CLOSE V1;
END;


(II)
1. Add a Salary and Bonus column in the Faculty_Master Table and calculate the bonus of each faculty of “MCA” department which is based on the 5% of their salary. If the salary in less than 25000, then raise the exception.
DECLARE
    CURSOR C1 IS SELECT * FROM F_MASTER;
    BNS NUMBER(10);
    SALBNS NUMBER(10);
BEGIN
    BNS := 0;
    FOR C IN C1
    LOOP
        DBMS_OUTPUT.PUT_LINE('SALARY --> ' || C.SALARY);
            IF C.SALARY > 25000 THEN
                BNS := C.SALARY * 0.05;
            END IF;
        DBMS_OUTPUT.PUT_LINE(BNS);
        SALBNS := BNS + C.SALARY;
        DBMS_OUTPUT.PUT_LINE(SALBNS);
        UPDATE F_MASTER SET BONUS = SALBNS WHERE F_NO = C.F_NO;
        COMMIT;
        BNS := 0;
    END LOOP;
END;

2. Display name of 2 faculties getting maximum bonus.
DECLARE 
    NAME F_MASTER.FNAME%TYPE;
    BONUS F_MASTER.BONUS%TYPE;
    CURSOR C1 IS SELECT FNAME, BONUS FROM F_MASTER WHERE BONUS IS NOT NULL ORDER BY BONUS DESC;  
BEGIN
   OPEN C1;
   LOOP 
        FETCH C1 INTO NAME, BONUS;
        EXIT WHEN C1%ROWCOUNT > 2;
        DBMS_OUTPUT.PUT_LINE('FACULTY NAME - ' || NAME);  
        DBMS_OUTPUT.PUT_LINE('BONUS - ' || BONUS);
        DBMS_OUTPUT.PUT_LINE('---------');
   END LOOP;
   CLOSE C1;
END;


(III)
Use following tables are create a report as shown below. supplier (sid, sname, contactnum)
parts (pid, pname, color, unitrate)
catalog (sid, pid, qty) [primary key(sid,pid)]
Write a PLSQl Cursor to take a supplier’s name as an input from the user and prepare a
report in the following format: 
***********************************************************
        PART ID PART NAME QUANTITY UNIT PRICE TOTAL
************************************************************
                                                Grand Total:
Raise a user defined exception when the supplier’s name not found in the database table.

DECLARE
   TOTAL NUMBER;
   GRANDTOTAL NUMBER := 0;
   NAME SUPPLIER.SNAME%TYPE;
   CURSOR C1(NAME SUPPLIER.SNAME%TYPE) IS SELECT PARTS.PID, PARTS.PNAME, QTY, RATE FROM CATALOG1 JOIN PARTS
   ON 
   PARTS.PID = CATALOG1.PID
   JOIN SUPPLIER
   ON 
   SUPPLIER.SID = CATALOG1.SID
   WHERE SUPPLIER.SNAME LIKE NAME;
BEGIN
   NAME := '&SUPPLIER_NAME';
   FOR V1 IN C1(NAME)
   LOOP
   TOTAL := V1.QTY * V1.RATE;
   GRANDTOTAL := GRANDTOTAL + TOTAL;
   DBMS_OUTPUT.PUT_LINE(LPAD(V1.PID,10)||LPAD(V1.PNAME,10)||LPAD(V1.QTY,10)||LPAD(V1.RATE,10)||LPAD(TOTAL,10)||LPAD(GRANDTOTAL,10));
   END LOOP;
END;

------------------------------------------------------------------------------------------------------------------------

DAY_17

1) Write a procedure which will take Faculty ID as an input and will display all the information of that faculty
CREATE OR REPLACE PROCEDURE FMASTER
(FNO IN F_MASTER.F_NO%TYPE)
IS
NAME F_MASTER.FNAME%TYPE;
SAL F_MASTER.SALARY%TYPE; 
BEGIN
    SELECT FNAME,SALARY INTO NAME,SAL FROM F_MASTER WHERE F_NO = FNO;
    DBMS_OUTPUT.PUT_LINE(NAME);
    DBMS_OUTPUT.PUT_LINE(SAL);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERROR - FACULTY NUMBER NOT FOUND');
END;


2) Write a stored procedure that uses an INOUT parameter and an IN parameter. The user will supply 'M' or 'F' through IN parameter (emp_gender) to count a number of male or  female from Employee table. The INOUT parameter (mfgender) will return the result to a user.
CREATE TABLE EMP(ENO NUMBER(4),ENAME VARCHAR(10),GENDER VARCHAR(1),SALARY NUMBER(5),CHECK (GENDER IN('M','F')));

INSERT INTO EMP VALUES(1,'MANAV','M',50000);
INSERT INTO EMP VALUES(2,'SANKET','M',70000);
INSERT INTO EMP VALUES(3,'HARSH','M',80000);
INSERT INTO EMP VALUES(4,'DIYA','F',5000);
INSERT INTO EMP VALUES(5,'ISHA','F',9000);
INSERT INTO EMP VALUES(6,'MAYUR','M',9000);

CREATE OR REPLACE PROCEDURE EMPGEN
(GEN IN OUT EMP.GENDER%TYPE) IS
BEGIN
    SELECT COUNT(GENDER) INTO GEN FROM EMP WHERE GENDER = GEN; 
END;

DECLARE 
    GN EMP.GENDER%TYPE;
BEGIN
    GN := '&GENDER';
    EMPGEN(GN);
    DBMS_OUTPUT.PUT_LINE(GN);
END;

3) Write a procedure which will take minimum limit and maximum limit of salary and the execution of the procedure will display name of the employees having salary between the range.

CREATE OR REPLACE PROCEDURE PSALARY
(FNO IN F_MASTER.F_NO%TYPE)
IS
 NAME F_MASTER.FNAME%TYPE;
 SAL F_MASTER.SALARY%TYPE;
BEGIN
    SELECT FNAME,SALARY INTO NAME,SAL FROM F_MASTER WHERE F_NO = FNO;
    IF (SAL > 15000 AND SAL <75000) THEN
    DBMS_OUTPUT.PUT_LINE(NAME);
    DBMS_OUTPUT.PUT_LINE(SAL);
    ELSE
    RAISE NO_DATA_FOUND;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERROR - DATA NOT FOUND');
END;


CREATE OR REPLACE PROCEDURE PSALARY
(FNO IN F_MASTER.F_NO%TYPE)
IS
 NAME F_MASTER.FNAME%TYPE;
 SAL F_MASTER.SALARY%TYPE;
BEGIN
    SELECT FNAME,SALARY INTO NAME,SAL FROM F_MASTER WHERE F_NO = FNO;
    IF (SAL > 15000 AND SAL <75000) THEN
    DBMS_OUTPUT.PUT_LINE(NAME);
    DBMS_OUTPUT.PUT_LINE(SAL);
    ELSE
    RAISE NO_DATA_FOUND;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERROR - DATA NOT FOUND');
END;

CREATE OR REPLACE PROCEDURE PSALARY
(FNO IN F_MASTER.F_NO%TYPE)
IS
 NAME F_MASTER.FNAME%TYPE;
 SAL F_MASTER.SALARY%TYPE;
BEGIN
    SELECT FNAME,SALARY INTO NAME,SAL FROM F_MASTER WHERE F_NO = FNO;
    IF (SAL > 15000 AND SAL <75000) THEN
    DBMS_OUTPUT.PUT_LINE(NAME);
    DBMS_OUTPUT.PUT_LINE(SAL);
    ELSE
    RAISE NO_DATA_FOUND;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERROR - DATA NOT FOUND');
END;

