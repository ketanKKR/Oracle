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

1)CREATE TABLE CLIENTS AS SELECT * FROM CLIENT_MASTER;
2)INSERT INTO CLIENTS SELECT * FROM CLIENT_MASTER;
3)CREATE TABLE PRODUCTS AS SELECT * FROM PRODUCT_MASTER;
4)INSERT INTO PRODUCTS SELECT * FROM PRODUCT_MASTER WHERE P_NO IN ('P001','P002');
5)

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