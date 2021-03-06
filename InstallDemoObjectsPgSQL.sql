CREATE TABLE DEPT (
  DEPTNO SERIAL NOT NULL,
  DNAME VARCHAR(14),
  LOC VARCHAR(13),
  PRIMARY KEY (DEPTNO)
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE EMP (
  EMPNO SERIAL NOT NULL,
  ENAME VARCHAR(10),
  JOB VARCHAR(9),
  MGR INTEGER,
  HIREDATE TIMESTAMP,
  SAL REAL,
  COMM REAL,
  DEPTNO INT REFERENCES DEPT,
  PRIMARY KEY (EMPNO)
);

INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'1981-9-28',1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'1987-7-13',3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'1987-7-13',1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'1981-12-3',950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'1981-12-3',3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);

CREATE TABLE CRGRID_TEST(
  Id SERIAL NOT NULL,
  Name VARCHAR(10),
  Country VARCHAR(30),
  City VARCHAR(30),
  Street VARCHAR(30),
  BirthDate DATE,
  Job VARCHAR(9),
  Hiredate DATE,
  Sal NUMERIC(7, 2),
  Remarks TEXT,
  PRIMARY KEY (Id)
);
INSERT INTO CRGRID_TEST (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sal)
    VALUES (5001, 'SMITH', 'ENGLAND', 'LONDON', 'BOND st.', '1963-11-12', 'CLERK','1980-12-17', 800);
INSERT INTO CRGRID_TEST (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sal)
    VALUES (5002, 'ALLEN', 'ENGLAND', 'LONDON', 'BAKER st.', '1961-03-04', 'SALESMAN','1981-02-20', 1600);
INSERT INTO CRGRID_TEST (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sal)
    VALUES(5003, 'MARTIN', 'FRANCE', 'LION', 'WEAVER st.', '1957-01-23', 'MANAGER','1981-04-02', 2900);

CREATE TABLE UniDAC_BLOB (
  UID SERIAL NOT NULL,
  Name VARCHAR(50),
  Picture BYTEA,
  PRIMARY KEY (UID)
);

CREATE TABLE UniDAC_Text (
  UID SERIAL NOT NULL,
  Name VARCHAR(50),
  TextField TEXT,
  PRIMARY KEY (UID)
);

CREATE TABLE UniDAC_Loaded (
  Intg INTEGER,
  Dbl  DOUBLE PRECISION,
  Str  VARCHAR(50),
  Dat  TIMESTAMP
);

CREATE FUNCTION SEL_FROM_EMP() RETURNS SETOF Emp AS $$
    SELECT * FROM Emp ORDER BY EmpNo;
$$ LANGUAGE SQL;
