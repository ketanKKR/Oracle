CREATE TABLE EMP 
(EMPNO INT(5) PRIMARY KEY,
ENAME VARCHAR(20),
JOB VARCHAR(10),
MGR INT(4),
HIREDATE DATE,
SAL INT(7),
COMM INT (7),
DEPNO INT(2));

INSERT INTO EMP VALUES (7369,"SMITH","CLERK",7902,'1980-12-17',800,'0',20);

SQL> INSERT INTO t(dob) VALUES(TO_DATE('17/12/2015', 'DD/MM/YYYY'));

SELECT * FROM EMP WHERE SAL => 1000 AND (JOB='CLERK' OR JOB='SALESMAN');

SELECT * FROM EMP WHERE ENAME LIKE 'A%' AND SAL IN (1600,1100,950,2975,5000,3000,10000);

SELECT DEPNO,JOB, COUNT(JOB) FROM EMP GROUP BY DEPNO,JOB HAVING COUNT(JOB) >= 2;

SELECT DEPNO,JOB, COUNT(JOB) FROM EMP WHERE JOB='CLERK' GROUP BY DEPNO,JOB HAVING COUNT(JOB) >= 2;

SELECT DEPNO,AVG(SAL) FROM EMP GROUP BY DEPNO;

SELECT DEPNO,SUM(SAL) FROM EMP GROUP BY DEPNO;

SELECT ENAME,JOB FROM EMP ORDER BY ENAME ASC;

SELECT MAX(HIREDATE) FROM EMP;

SELECT ENAME,JOB,DEPNO,MAX(SAL) FROM EMP GROUP BY DEPNO;

----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ACTRAN VALUES
(1,'2000-04-01',500,'W',101),
(2,'2000-06-02',1000,'D',102),
(3,'2000-07-04',500,'W',103),
(4,'2000-12-20',6000,'D',104),
(5,'2001-12-25',200,'D',105),
(6,'2001-01-26',1500,'D',106),
(7,'2001-01-21',3000,'D',107),
(8,'2002-01-20',5000,'D',108),
(9,'2002-02-26',50000,'D',109),
(10,'2003-03-25',4500,'D',110);

ALTER TABLE ACTRAN ADD COLUMN USERNM VARCHAR(10);

ALTER TABLE ACTRAN MODIFY COLUMN TNO INT(2) UNIQUE;
ALTER TABLE ACTRAN MODIFY COLUMN USERNM VARCHAR(10) UNIQUE;

ALTER TABLE ACTRAN DROP FOREIGN KEY actran_ibfk_1;
ALTER TABLE ACTRAN DROP PRIMARY KEY;
ALTER TABLE ACMASTER DROP PRIMARY KEY;

ALTER TABLE ACMASTER MODIFY COLUMN NAME VARCHAR(8);

ALTER TABLE ACMASTER MODIFY COLUMN ACNO INT(5) PRIMARY KEY;

ALTER TABLE ACMASTER MODIFY COLUMN BAL INT(10) CHECK(BAL>0);

ALTER TABLE ACTRAN MODIFY COLUMN USERNAME VARCHAR(10) WHERE USERNM;

ALTER TABLE ACMASTER MODIFY COLUMN NAME VARCHAR(10);

ALTER TABLE ACMASTER DROP CONSTRAINT acmaster_chk_1;

UPDATE ACTRAN SET USERNAME='SCOTT';

UPDATE ACMASTER SET BAL=BAL+100;

DELETE FROM ACTRAN WHERE TNO = 1;

UPDATE ACTRAN SET NAME = 'ROGER' WHERE ACNO = 104;

DELETE FROM ACMASTER WHERE ACNO = 110;
DELETE FROM ACTRAN WHERE ACNO = 110;

SELECT NAME FROM ACMASTER WHERE ACDATE < '1999-01-01';

SELECT * FROM ACMASTER WHERE BAL > 2000;

UPDATE ACTRAN SET AMOUNT=5000, TYPE='D' WHERE TNO = 3;

ALTER TABLE ACMASTER ADD COLUMN CITY VARCHAR(10);

UPDATE ACMASTER SET CITY='KATPAR' WHERE ACNO = 105 OR ACNO = 106 OR ACNO = 107 OR ACNO = 108 OR ACNO = 109;

UPDATE ACTRAN SET TDATE = '2002-04-01' WHERE TNO = 9;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
23 OCT 2019


INSERT INTO STUDENT VALUES (1,'KETAN','M','BCA');
INSERT INTO STUDENT VALUES (2,'VIJAY','M','MCA');
INSERT INTO STUDENT VALUES (3,'HETAL','F','BBA');
INSERT INTO STUDENT VALUES (4,'JIGNESH','M','BA');
INSERT INTO STUDENT VALUES (5,'PARTH','M','BCA');
INSERT INTO STUDENT VALUES (6,'VIPUL','M','B.COM');
INSERT INTO STUDENT VALUES (7,'NILESH','M','MCA');
INSERT INTO STUDENT VALUES (8,'BHAVESH','M','BBA');
INSERT INTO STUDENT VALUES (9,'AYAN','M','BCA');
INSERT INTO STUDENT VALUES (10,'PARTH','M','BCA');

INSERT INTO EXAM VALUES (1,101,95);
INSERT INTO EXAM VALUES (2,104,77);
INSERT INTO EXAM VALUES (3,105,67);
INSERT INTO EXAM VALUES (4,105,97);
INSERT INTO EXAM VALUES (5,101,'');
INSERT INTO EXAM VALUES (6,106,33);
INSERT INTO EXAM VALUES (7,104,28);
INSERT INTO EXAM VALUES (8,105,23);
INSERT INTO EXAM VALUES (9,101,66);
INSERT INTO EXAM VALUES (10,101,55);

1)SELECT * FROM STUDENT STD,EXAM EXM WHERE ST.ROLLNO=EX.ROLLNO;

2)SELECT SNAME,GENDER,MARKS FROM STUDENT STD,EXAM EXM WHERE STD.ROLLNO=EXM.ROLLNO;

3)SELECT * FROM STUDENT WHERE COURSE='BBA';

4)SELECT INITCAP(SNAME) AS STUDENT_NAME FROM STUDENT;

5)SELECT SUBSTR(SNAME,1,3) FROM STUDENT;

6)SELECT * FROM STUDENT,EXAM WHERE MARKS IS NULL AND STUDENT.ROLLNO=EXAM.ROLLNO;

7)SELECT PAPERNO,SUM(MARKS) AS TOTAL_MARKS FROM EXAM GROUP BY PAPERNO;

8)SELECT * FROM STUDENT STD,EXAM EXM WHERE MARKS=(SELECT MAX(MARKS) FROM EXAM WHERE PAPERNO=101) AND EXM.ROLLNO=STD.ROLLNO;

9)SELECT GENDER,COUNT(GENDER) AS TOTAL FROM STUDENT GROUP BY GENDER;

10)SELECT * FROM STUDENT STD,EXAM EXM WHERE LENGTH(SNAME)=5 AND STD.ROLLNO=EXM.ROLLNO;

-----------------------------------------------------------------------------------------------------------------------------------
23 OCT 2019


SQL> CREATE TABLE BOWLER (
NAME VARCHAR2(20) NOT NULL,
SURNAME VARCHAR2(20)  NOT NULL,
COUNTRY VARCHAR2(30) CONSTRAINT CHK_Country CHECK (COUNTRY='INDIA' OR COUNTRY='AUSTRALIA' OR COUNTRY='NEW ZEALAND'),
WICKETS NUMBER(5) CONSTRAINT CHK_Wic CHECK (WICKETS >=0)
);

CREATE TABLE BATSMAN (
NAME VARCHAR2(20) NOT NULL,
SURNAME VARCHAR2(20)  NOT NULL,
COUNTRY VARCHAR2(30) CONSTRAINT CHK_Country2 CHECK (COUNTRY='INDIA' OR COUNTRY='AUSTRALIA' OR COUNTRY='NEW ZEALAND'),
RUNS NUMBER(5) CONSTRAINT CHK_Runs CHECK (RUNS >=0)
);

INSERT INTO BOWLER VALUES ('JASPRIT','BUMRAH','INDIA',39);
INSERT INTO BOWLER VALUES ('MITCHELL','STARC','AUSTRALIA',35);
INSERT INTO BOWLER VALUES ('MOHAMMED','SHAMI','INDIA',30);
INSERT INTO BOWLER VALUES ('RICHARD','HADLEE','NEW ZEALAND',20);
INSERT INTO BOWLER VALUES ('ANIL','KUMBLE','INDIA',15);

INSERT INTO BATSMAN VALUES ('VIRAT','KOHLI','INDIA',3500);
INSERT INTO BATSMAN VALUES ('DAVID','WARNER','AUSTRALIA',3400);
INSERT INTO BATSMAN VALUES ('ROHIT','SHARMA','INDIA',3000);
INSERT INTO BATSMAN VALUES ('KANE','WILLIAMSON','NEW ZEALAND',2000);
INSERT INTO BATSMAN VALUES ('HARDIK','PANDYA','INDIA',1500);

1)SELECT NAME || ' ' || SURNAME AS FULL_NAME FROM BOWLER;

2)SELECT NAME,WICKETS FROM BOWLER WHERE WICKETS=(SELECT MAX(WICKETS) FROM BOWLER);

3)SELECT COUNTRY,MAX(RUNS) FROM BATSMAN GROUP BY COUNTRY;

4)SELECT NAME,SURNAME,RUNS FROM BATSMAN WHERE RUNS>100;

5)SELECT COUNTRY,SUM(PlayerCount) AS TOTAL_PLAYER
FROM(
   SELECT COUNTRY,COUNT(NAME) AS PlayerCount FROM BOWLER WHERE COUNTRY='INDIA' GROUP BY COUNTRY
   UNION ALL
   SELECT COUNTRY,COUNT(NAME) AS PlayerCount FROM BATSMAN WHERE COUNTRY='INDIA' GROUP BY COUNTRY
)GROUP BY COUNTRY;

6)SELECT INITCAP(NAME) FROM BOWLER;

7)SELECT UPPER(NAME) FROM BATSMAN;

8)DESC BOWLER; DESC BATSMAN;

9)SELECT DISTINCT COUNTRY FROM BOWLER UNION ALL SELECT DISTINCT COUNTRY FROM BATSMAN;

10)SELECT * FROM BATSMAN ORDER BY NAME;

----------------------------------------------------------------------------------------------------------------------------------------------
2 APRIL 2019


CREATE TABLE EMPLOYEE
(EMPNO VARCHAR2(4) PRIMARY KEY,
NAME VARCHAR2(20) NOT NULL,
DOB DATE CONSTRAINT CHK_EMP_DOB_Date CHECK (DOB>'01-JAN-1970'),
CITY VARCHAR2(20) NOT NULL CONSTRAINT);

CREATE TABLE COMPANY (
COMNO VARCHAR2(4) PRIMARY KEY,
COM_NAME VARCHAR2(20) NOT NULL,
CITY VARCHAR2(20) NOT NULL
);

CREATE TABLE WORKS (
EMPNO VARCHAR2(4), CONSTRAINT FORKEY_EMPNO FOREIGN KEY (EMPNO) REFERENCES EMPLOYEE(EMPNO),
COMNO VARCHAR2(4), CONSTRAINT FORKEY_COMNO FOREIGN KEY (COMNO) REFERENCES COMPANY(COMNO),
SALARY NUMBER(10)
);

INSERT INTO EMPLOYEE VALUES ('E001','RADHA','27-APR-1974','BHAVNAGAR');
INSERT INTO EMPLOYEE VALUES ('E002','RITA','10-JAN-1980','RAJKOT');
INSERT INTO EMPLOYEE VALUES ('E003','ROMA','10-APR-1979','SURAT');
INSERT INTO EMPLOYEE VALUES ('E004','NILESH','28-FEB-1976','RAJKOT');

INSERT INTO COMPANY VALUES ('C001','GOPAL SALES','BOMBAY');
INSERT INTO COMPANY VALUES ('C002','BHARAT ELECTRONICS','PUNE');
INSERT INTO COMPANY VALUES ('C003','ABC INDIA PVT. LTD.','NAGPUR');

INSERT INTO WORKS VALUES ('E001','C001',40000);
INSERT INTO WORKS VALUES ('E002','C002',30000);
INSERT INTO WORKS VALUES ('E003','C001',35000);
INSERT INTO WORKS VALUES ('E004','C002',45000);
INSERT INTO WORKS VALUES ('E005','C003',30000);

1)SELECT EMP.*,WORKS.COMNO,COM_NAME,SALARY FROM EMPLOYEE EMP,COMPANY CMP,WORKS WHERE EMP.EMPNO=WORKS.EMPNO AND CMP.COMNO=WORKS.COMNO AND WORKS.COMNO='C001';

2)SELECT EMP.NAME,WO.SALARY FROM EMPLOYEE EMP,WORKS WO WHERE WO.SALARY=(SELECT MAX(SALARY) FROM WORKS) AND WO.EMPNO=EMP.EMPNO;

3)SELECT NAME,DOB,TRUNC(MONTHS_BETWEEN(SYSDATE,DOB)/12) AGE FROM EMPLOYEE;

4)SELECT NAME,DOB,SALARY FROM EMPLOYEE EMP,WORKS WHERE EMP.EMPNO=WORKS.EMPNO;

5)SELECT NAME,DOB FROM EMPLOYEE WHERE TO_CHAR(DOB,'MON') = 'APR';
  SELECT NAME,DOB FROM EMPLOYEE WHERE EXTRACT(MONTH FROM DOB) = 4;

6)SELECT EMP.*,COM_NAME,CMP.COMNO,SALARY FROM EMPLOYEE EMP,COMPANY CMP,WORKS WHERE EMP.EMPNO=WORKS.EMPNO AND CMP.COMNO=WORKS.COMNO AND SALARY<40000;
  SELECT NAME,SALARY FROM EMPLOYEE EMP,WORKS WHERE SALARY>(SELECT SALARY FROM WORKS WHERE EMPNO='E005') AND EMP.EMPNO=WORKS.EMPNO;

7)SELECT EMP.*,CMP.COMNO,COM_NAME,SALARY FROM EMPLOYEE EMP,COMPANY CMP,WORKS WHERE SALARY>30000 AND EMP.EMPNO=WORKS.EMPNO AND CMP.COMNO=WORKS.COMNO;

8)SELECT SUBSTR(NAME,-3,3) FROM EMPLOYEE;

9)SELECT CITY FROM EMPLOYEE WHERE CITY LIKE '%K%' OR CITY LIKE '%k%';
  SELECT DISTINCT CITY FROM EMPLOYEE WHERE CITY LIKE '%K%' OR CITY LIKE '%k%';

10)SELECT NAME,SALARY FROM EMPLOYEE EMP,WORKS WHERE EMP.EMPNO=WORKS.EMPNO AND SALARY BETWEEN 30000 AND 40000;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
22 OCT 2019


CREATE TABLE DEPARTMENT 
(DEPT_ID NUMBER(3) PRIMARY KEY, 
 DEPT_NAME VARCHAR2(20) NOT NULL,
 DEPT_LOC VARCHAR2(20) NOT NULL);

CREATE TABLE EMP_DEPT (
EMP_ID NUMBER(3) PRIMARY KEY,
EMP_NAME VARCHAR2(20) NOT NULL,
DOJ DATE,
DOB DATE,
SALARY NUMBER(7) NOT NULL,
DEPT_ID NUMBER(3),  CONSTRAINT FORKEY_DEPTID FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID));


INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','AHEMDABAD');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','BENGALURE');
INSERT INTO DEPARTMENT VALUES (30,'SALES','AHEMDABAD');
INSERT INTO DEPARTMENT VALUES (40,'MARKETING','NEW DELHI');

INSERT INTO EMP_DEPT VALUES (1,'NILESH','10-JAN-2010','22-OCT-1987',150000,20);
INSERT INTO EMP_DEPT VALUES (2,'RADHA','28-JAN-2010','01-JAN-1988',90000,10);
INSERT INTO EMP_DEPT VALUES (3,'BHAVESH','08-FEB-2010','07-APR-1989',80000,10);
INSERT INTO EMP_DEPT VALUES (4,'VIJAY','11-MAR-2010','25-MAY-1990',100000,20);
INSERT INTO EMP_DEPT VALUES (5,'GEETA','15-JUN-2011','22-OCT-1988',50000,30);
INSERT INTO EMP_DEPT VALUES (6,'PARTH','12-OCT-2015','10-NOV-1989',22000,30);
INSERT INTO EMP_DEPT VALUES (7,'HARSH','17-SEP-2015','26-JUL-1991',40000,40);
INSERT INTO EMP_DEPT VALUES (8,'PARAG','03-JAN-2016','22-JUN-1987',150000,30);
INSERT INTO EMP_DEPT VALUES (9,'NILESH','30-DEC-2017','22-OCT-1980',150000,30);
INSERT INTO EMP_DEPT VALUES (10,'KETAN','01-JUN-2020','01-JUN-2001',140000,40);

1)SELECT DEPT_ID,DEPT_NAME FROM DEPARTMENT;

2)SELECT * FROM EMP_DEPT WHERE SALARY>25000;

3)SELECT * FROM EMP_DEPT ORDER BY EMP_NAME;

4)UPDATE EMP_DEPT SET SALARY=SALARY+500;

5)SELECT * FROM EMP_DEPT WHERE TO_CHAR(DOB,'MON')='OCT';
  SELECT * FROM EMP_DEPT WHERE EXTRACT(MONTH FROM DOB) = 10;

6)SELECT EMP_DEPT.*,TRUNC(MONTHS_BETWEEN(SYSDATE,DOB)/12) AGE FROM EMP_DEPT;

7)SELECT * FROM DEPARTMENT DPT,EMP_DEPT WHERE DEPT_NAME='SALES' AND DPT.DEPT_ID=EMP_DEPT.DEPT_ID;

8)SELECT EMP.*,DPT.DEPT_NAME,DPT.DEPT_ID FROM DEPARTMENT DPT,EMP_DEPT EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP_DEPT) AND EMP.DEPT_ID=DPT.DEPT_ID;

9)SELECT EMP_ID,EMP_NAME,DOJ,DOB,SALARY,DEPT_ID,TRUNC(MONTHS_BETWEEN(SYSDATE,DOJ)/12) EXPERIENCE FROM EMP_DEPT WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,DOJ)/12)>9;

10)SELECT DPT.DEPT_NAME,COUNT(EMP.DEPT_ID) FROM DEPARTMENT DPT,EMP_DEPT EMP WHERE EMP.DEPT_ID=DPT.DEPT_ID GROUP BY DPT.DEPT_NAME;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

1)SELECT * FROM EMP;

2)SELECT DISTINCT JOB FROM EMP;

3)SELECT * FROM EMP ORDER BY SAL;

4)SELECT * FROM EMP ORDER BY DEPTNO,JOB DESC;

5)SELECT DISTINCT JOB FROM EMP;

6)SELECT * FROM EMP WHERE JOB='MANAGER';

7)SELECT * FROM EMP WHERE HIREDATE<'01-JAN-1981';

8)SELECT EMPNO,ENAME,SAL,SAL/30 AS DAILY_SAL FROM EMP ORDER BY SAL;

9)SELECT EMPNO,ENAME,JOB,HIREDATE,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) AS EXPERIENCE FROM EMP WHERE JOB='MANAGER';

10)SELECT EMPNO,ENAME,SAL,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) EXPERIENCE FROM EMP WHERE DEPTNO=20;

11)SELECT * FROM EMP WHERE COMM>SAL;

12)SELECT * FROM EMP WHERE HIREDATE>'31-MAY-1981' ORDER BY JOB;

13)SELECT EMP.*,SAL/30 AS DAILY_SAL FROM EMP EMP WHERE SAL/30>100;

14)SELECT * FROM EMP WHERE JOB IN ('CLERK','ANALYST') ORDER BY JOB;

15)SELECT * FROM EMP WHERE HIREDATE IN ('1-MAY-81','3-DEC-81','17-DEC-81','19-JAN-80') ORDER BY HIREDATE;

16)SELECT * FROM EMP WHERE DEPTNO IN (10,20);

17)SELECT * FROM EMP WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;

18)SELECT * FROM EMP WHERE HIREDATE LIKE '%-AUG-80';

19)SELECT EMP.*,SAL*12 AS ANNUAL_SAL FROM EMP EMP WHERE SAL*12 BETWEEN 22000 AND 45000;

20)SELECT * FROM EMP WHERE LENGTH(ENAME)=5;

21)SELECT * FROM EMP WHERE LENGTH(ENAME)=5 AND ENAME LIKE 'S%';

22)SELECT * FROM EMP WHERE LENGTH(ENAME)=4 AND ENAME LIKE '__R%';

23)SELECT * FROM EMP WHERE LENGTH(ENAME)=5 AND ENAME LIKE 'S%H';

24)SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'MON') = 'JAN';
   SELECT * FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE) = 1;

25)SELECT * FROM EMP WHERE HIREDATE LIKE '%-_A%-%';

26)SELECT * FROM EMP WHERE LENGTH(SAL)=4 AND SAL LIKE '%0';

27)SELECT * FROM EMP WHERE ENAME LIKE '%LL%';

28)SELECT * FROM EMP WHERE HIREDATE BETWEEN '01-JAN-1980' AND '31-DEC-1989';

29)SELECT * FROM EMP WHERE NOT DEPTNO=20;

30)SELECT * FROM EMP WHERE NOT JOB IN ('PRESIDENT','MANAGER') ORDER BY SAL;

31)

32)SELECT * FROM EMP WHERE NOT EMPNO LIKE '78%';

33)SELECT * FROM EMP WHERE MGR IS NOT NULL;

34)SELECT * FROM EMP WHERE NOT HIREDATE LIKE '%-MAR-%';
   SELECT * FROM EMP WHERE NOT EXTRACT(MONTH FROM HIREDATE) = 3;

35)SELECT * FROM EMP WHERE JOB='CLERK' AND DEPTNO=20;

36)SELECT * FROM EMP WHERE DEPTNO=20 OR DEPTNO=30 AND HIREDATE LIKE '%-%-81';

37)SELECT * FROM EMP WHERE ENAME='SMITH';

38)SELECT EMP.ENAME,DEPT.LOC FROM EMP,DEPT WHERE EMP.ENAME='SMITH' AND EMP.DEPTNO=DEPT.DEPTNO;
   SELECT EMP.ENAME,DEPT.LOC FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO WHERE EMP.ENAME='SMITH';

39)SELECT EMP.*,DEPT.DNAME,EDEPT.LOC FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;

40)SELECT EMP.EMPNO,EMP.ENAME,EMP.JOB,EMP.SAL,DEPT.DNAME,DEPT.LOC,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) EXPERIENCE
   FROM EMP,DEPT 
   WHERE
   EMP.DEPTNO=DEPT.DEPTNO AND
   EMP.JOB IN ('MANAGER','ANALYST') AND
   DEPT.LOC IN ('NEW YORK','DALLAS') AND 
   EMP.COMM IS NULL OR EMP.COMM=0 AND
   EMP.DEPTNO=DEPT.DEPTNO ORDER BY LOC;

41)

42)SELECT E.ENAME,E.SAL,G.* FROM SALGRADE G,EMP E
  WHERE E.SAL>=G.LOSAL AND E.SAL<=G.HISAL
  ORDER BY G.GRADE;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE STUDENT_RESULT (
   RNO NUMBER(5),
   SNAME VARCHAR2(30) CHECK(SNAME=INITCAP(SNAME) OR SNAME=UPPER(SNAME)),
   BDATE DATE);

1)ALTER TABLE STUDENT_RESULT ADD (TOTAL NUMBER(5),PER NUMBER(6,2),GRADE VARCHAR2(3));

INSERT INTO STUDENT_RESULT VALUES (1,'KETAN RATHOD','01-JUN-2001',550,91.66,'A');
INSERT INTO STUDENT_RESULT VALUES (2,'BHAVESH PARMAR','28-JAN-2003',400,66.66,'B');
INSERT INTO STUDENT_RESULT VALUES (3,'HETAL MEHTA','15-APR-2002',450,75.00,'B');

2)SELECT * FROM STUDENT_RESULT ORDER BY PER DESC;

3)SELECT SNAME,BDATE,TRUNC(MONTHS_BETWEEN(SYSDATE,BDATE)/12) AGE FROM STUDENT_RESULT;

4)SELECT * FROM STUDENT_RESULT WHERE TOTAL BETWEEN 150 AND 190 AND PER<60.00;

5)DELETE STUDENT_RESULT WHERE GRADE='A' OR GRADE='B';

6)SELECT * FROM STUDENT_RESULT WHERE BDATE BETWEEN '01-JAN-1991' AND '31-DEC-1992';

7)CREATE TABLE NEW_STUDENT (
   RNO NUMBER(5),
   SNAME VARCHAR2(30) CHECK(SNAME=INITCAP(SNAME) OR SNAME=UPPER(SNAME)),
   TOTAL NUMBER(5),
   PER NUMBER(6,2));

8)DELETE NEW_STUDENT WHERE PER<40;

9)DELETE STUDENT_RESULT WHERE SNAME LIKE 'S%';

-----------------------------------------------------------------------------------------------------------------------------------------------------------


DECLARE
   VEMPNO EMP.EMPNO%TYPE;
   VENAME EMP.ENAME%TYPE;
   VSAL EMP.SAL%TYPE;
   VJOB EMP.JOB%TYPE;
   VHIREDATE EMP.HIREDATE%TYPE;
BEGIN
   DBMS_OUTPUT.PUT_LINE('=============================================================');
   DBMS_OUTPUT.PUT_LINE('*************EMPLOYEE DETAILS*************');
   DBMS_OUTPUT.PUT_LINE('=============================================================');
   
   SELECT EMPNO,ENAME,SAL,JOB,HIREDATE INTO VEMPNO,VENAME,VSAL,VJOB,VHIREDATE FROM EMP WHERE EMPNO=&NO;
   
   DBMS_OUTPUT.PUT_LINE('EMPLOYEE NO:-' || VEMPNO);
   DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME:-' || VENAME);
   DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY:-' || VSAL);
   DBMS_OUTPUT.PUT_LINE('EMPLOYEE JOB:-' || VJOB);
   DBMS_OUTPUT.PUT_LINE('EMPLOYEE HIREDATE' || VHIREDATE);
END;
/

set serveroutput on
/

------------------------------------------------------------------------------------------------
DECLARE
   DAYS NUMBER;
BEGIN

   DAYS:=&DAYS;
   
   CASE DAYS
      WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Monday');
      WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('Tuesday');
      WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('Wednesday');
      WHEN 4 THEN DBMS_OUTPUT.PUT_LINE('Thursday');
      WHEN 5 THEN DBMS_OUTPUT.PUT_LINE('Friday');
      WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Saturday ');
      WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Sonday');
      ELSE DBMS_OUTPUT.PUT_LINE('Enter Valid option!');
   END CASE;
END;
/

-----------------------------------------------------------------------------------------------------

