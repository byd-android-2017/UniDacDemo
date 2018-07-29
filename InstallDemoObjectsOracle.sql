CREATE TABLE DEPT (
  DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
  DNAME VARCHAR2(14) ,
  LOC VARCHAR2(13)
);

CREATE TABLE EMP (
  EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
  ENAME VARCHAR2(10),
  JOB VARCHAR2(9),
  MGR NUMBER(4),
  HIREDATE DATE,
  SAL NUMBER(7,2),
  COMM NUMBER(7,2),
  DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

CREATE TABLE UniDAC_BLOB (
  ID NUMBER(9) PRIMARY KEY,
  Title VARCHAR2(30),
  Picture BLOB
);

CREATE TABLE UniDAC_Text(
  ID NUMBER(9) PRIMARY KEY,
  Title VARCHAR2(30),
  TextField LONG
);

CREATE TABLE UniDAC_Loaded (
  Intg NUMBER(9),
  Dbl  DOUBLE PRECISION,
  Str  VARCHAR2(50),
  Dat  DATE
);

CREATE TABLE CRGRID_TEST (
  Id NUMBER(4) PRIMARY KEY,
  Name VARCHAR2(10),
  Country VARCHAR2(30),
  City VARCHAR2(30),
  Street VARCHAR2(30),
  BirthDate DATE,
  Job VARCHAR2(9),
  Hiredate DATE,
  Sal NUMBER(7, 2),
  Remarks LONG
);

CREATE PROCEDURE SEL_FROM_EMP(Cur OUT SYS_REFCURSOR)
AS
BEGIN
  OPEN Cur FOR
    SELECT * FROM Emp ORDER BY EmpNo;
END; 
/

INSERT INTO DEPT VALUES
  (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES
  (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
  (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
  (40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES
  (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
  (7499,'ALLEN','SALESMAN',7698,to_date('20-02-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
  (7521,'WARD','SALESMAN',7698,to_date('22-02-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
  (7566,'JONES','MANAGER',7839,to_date('02-04-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
  (7654,'MARTIN','SALESMAN',7698,to_date('28-09-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
  (7698,'BLAKE','MANAGER',7839,to_date('01-05-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
  (7782,'CLARK','MANAGER',7839,to_date('09-06-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
  (7788,'SCOTT','ANALYST',7566,to_date('13-07-87','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
  (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
  (7844,'TURNER','SALESMAN',7698,to_date('08-09-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
  (7876,'ADAMS','CLERK',7788,to_date('13-07-87','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
  (7900,'JAMES','CLERK',7698,to_date('03-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
  (7902,'FORD','ANALYST',7566,to_date('03-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
  (7934,'MILLER','CLERK',7782,to_date('23-01-1982','dd-mm-yyyy'),1300,NULL,10);

INSERT INTO CRGRID_TEST (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sal) VALUES
  (5001, 'SMITH', 'ENGLAND', 'LONDON', 'BOND st.', to_date('12.10.63', 'dd.mm.yy'), 'CLERK',
   to_date('17.12.80', 'dd.mm.yy'), 800);
INSERT INTO CRGRID_TEST (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sal) VALUES
  (5002, 'ALLEN', 'ENGLAND', 'LONDON', 'BAKER st.', to_date('04.03.61', 'dd.mm.yy'), 'SALESMAN',
   to_date('20.02.81', 'dd.mm.yy'), 1600);
INSERT INTO CRGRID_TEST (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sal) VALUES
  (5003, 'MARTIN', 'FRANCE', 'LION', 'WEAVER st.', to_date('23.01.57', 'dd.mm.yy'), 'MANAGER',
   to_date('02.04.81', 'dd.mm.yy'), 2900);

COMMIT;
