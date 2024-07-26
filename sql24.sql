/* Schema --> Description of the database
/* Retrieving data using sql select command */

SELECT * FROM EMPLOYEES

/* Projection, SELECTION & Joins  */

SELECT * FROM DEPARTMENTS
SELECT * FROM LOCATIONS

SELECT FIRST_NAME, JOB_ID, SALARY 
FROM EMPLOYEES

/* CASE INSENSITIVE
/* Computed column */

SELECT LAST_NAME, JOB_ID, SALARY, SALARY+500
FROM EMPLOYEES

SELECT LAST_NAME, SALARY,(SALARY+100)*12
FROM EMPLOYEES

/* NULL */

SELECT LAST_NAME, SALARY, COMMISSION_PCT, SALARY+COMMISSION_PCT
FROM EMPLOYEES

/* ALIASES */

SELECT LAST_NAME, SALARY,(SALARY+100)*12 AS BONUS
FROM EMPLOYEES

SELECT LAST_NAME, SALARY,(SALARY+100)*12  "YEARLY BONUS"
FROM EMPLOYEES

/* CONCATENATION */

SELECT FIRST_NAME || LAST_NAME
FROM EMPLOYEES

SELECT FIRST_NAME ||'  '|| LAST_NAME
FROM EMPLOYEES

/* DATE AND CHARACTER LITERALS MUST BE ENCLOSED WITHIN A SINGLE QUOTE OPERATOR */

SELECT FIRST_NAME ||' is a '|| JOB_ID
FROM EMPLOYEES

SELECT DEPARTMENT_NAME || q'[ department's manager id is ]'||MANAGER_ID AS DEPT_MANAGER
FROM DEPARTMENTS

/*SELECT TO BE FOLLOWED BY A FROM COMMAND ALWAYS */

SELECT SYSDATE
FROM DUAL

SELECT 100*8 FROM DUAL
SELECT DISTINCT(DEPARTMENT_ID) FROM EMPLOYEES
DESCRIBE EMPLOYEES

/* ACTIVITIES */

/* 1) How many unique departments have employees currently working in them?

2)	For employees who quit the organization, find out how many years the employees were employed. 
Assume that the year consists of 365.25 days. 
Also retrieve the EMPLOYEE_ID, JOB_ID, START_DATE, and END_DATE for these employees 

3)	Query the JOBS table and return a single expression of the form The Job Id for the <job_title’s> job is: <job_id>. 
Take note that the job_title should have an apostrophe and an “s” appended to it to read more naturally. 
A sample of this output for the organization president is: “The Job Id for the President’s job is: AD_PRES.” 
Alias this column expression as “Job Description” using the AS keyword.  */

/* Restricting data */

/* WHERE, BETWEEN, LIKE, IN , AND, OR, NOT, NULL */

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90

/* FROM, WHERE, SELECT, ORDER BY */
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90
ORDER BY SALARY DESC

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE LAST_NAME= 'King'
ORDER BY SALARY DESC

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > 10000
ORDER BY SALARY DESC

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <=15000
ORDER BY SALARY DESC

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 15000
ORDER BY SALARY DESC

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 10000 AND 15000
ORDER BY SALARY DESC

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > 10000 AND DEPARTMENT_ID IN (60,80,90)
ORDER BY SALARY DESC

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'A%'

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE LAST_NAME LIKE '_a%'

SELECT LAST_NAME, DEPARTMENT_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL

SELECT LAST_NAME, DEPARTMENT_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL

SELECT * FROM EMPLOYEES;
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE HIRE_DATE = '21-MAY-07'

/* COLUMNS WHICH ARE NOT IN THE SELECT STATEMENT CAN ALSO BE IN THE ORDER BY CLAUSE */
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE (JOB_ID = 'SA_REP'
OR JOB_ID = 'AD_PRES')
AND SALARY>10000
ORDER BY HIRE_DATE DESC

SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE (JOB_ID = 'SA_REP'
OR JOB_ID = 'AD_PRES')
AND SALARY>10000
ORDER BY 2

/* SUBSTITUTION VARIABLES */

SELECT LAST_NAME, EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &EMPLOYEE_NUM

SELECT LAST_NAME, EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &&EMPLOYEE_NUM

SELECT LAST_NAME, EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &EMPLOYEE_NUM1

/* USE A SINGLE QUOTE FOR PASSING DATE OR CHARACTER LITERAL AS INPUT */

SELECT LAST_NAME, EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID = '&INPUT'

/* DEFINE, VERIFY */
DEFINE EMPLOYEE_NUM = 100
UNDEFINE EMPLOYEE_NUM

/* ACTIVITIES */
/* 1. RETRIEVE A LIST OF DEPARTMENT NAMES THAT ENDS WITH "ING" AND SECOND CHARACTER IS "A"

2. Write a query that extracts the JOB_TITLE, MIN_SALARY, a which is the diffnd MAX_SALARY columns, 
as well as an expression called VARIANCE,erence between the MAX_SALARY and MIN_SALARY values, 
for each row. The result should include only JOB_TITLE values that contain either the word “President” or “Manager.” 
Sort the list in descending order based on the VARIANCE expression. If more than one row has the same VARIANCE value, then, 
sort these rows by JOB_TITLE in reverse alphabetic order. 

3)	A common computation performed by the Finance department relates to the calculation of taxes levied upon an employee. 
The tax deducted per employee is calculated by obtaining the annual salary for the employee and the current tax rate, 
which may vary from year to year as per the regulations laid from the ministry of finance. 
Write a reusable query for the current tax rate and for an employee_id as input, return the EMPLOYEE_ID, 
FIRST_NAME, SALARY, ANNUAL SALARY,TAX_RATE, and the TAX AMOUNT */

/*SINGLE ROW AND MULTI-ROW FUNCTIONS */

SELECT LAST_NAME
FROM EMPLOYEES
WHERE UPPER(LAST_NAME) = 'KING'

SELECT EMPLOYEE_ID, JOB_ID, CONCAT(FIRST_NAME, LAST_NAME) "FULL NAME",
LENGTH(LAST_NAME), INSTR(LAST_NAME,'a') "CONTAINS A?"
FROM EMPLOYEES
WHERE SUBSTR(JOB_ID,4)='REP'

SELECT ROUND(109999.79698680,2) FROM DUAL

/* DATES */

/* RR format */
/* YY format */

/* 18-June-19
19-May-78 */

/* 0-49 --> CURRENT CENTURY, 50-99 , LAST CENTURY 

SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < '01-FEB-08'

DD-MM-RR

CURRENT DATE      RR    YY 
_YEAR

1998   05-APR-98 1998  1998
1998   05-APR-22 2022  1921
2024   25-JUL-24 2024  2024
2024   25-JUL-68 1968  2068
2018   05-APR-18 2018  2018 
2018   05-APR-98 1998  2098 */

15-09-2022

22 --> RR --> 2022
78 --> RR --> 1978
22 --> YY --> 2022
78 --> YY --> 2078

SELECT SYSDATE FROM DUAL

SELECT EMPLOYEE_ID, ROUND((SYSDATE-HIRE_DATE)/7) WEEKS
FROM EMPLOYEES
ORDER BY WEEKS DESC

SELECT MONTHS_BETWEEN('01-JAN-03','12-DEC-10') FROM DUAL
SELECT NEXT_DAY('25-JUL-24', 'THURSDAY') FROM DUAL
SELECT LAST_DAY('25-JUL-24') FROM DUAL
SELECT ADD_MONTHS('25-JUL-24',2) FROM DUAL
SELECT NEXT_DAY('25-JUL-24', 4) FROM DUAL
SELECT ADD_MONTHS('30-SEP-23',-2) FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DD "OF" MONTH') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DDspth "OF" fmMONTH') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DDth "of" fmMONTH') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DD MM YYYY') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'YYYY') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'YEAR') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'MM') || ' is my birthday' 
FROM DUAL

SELECT FIRST_NAME || ' ' ||  LAST_NAME FROM EMPLOYEES


SELECT TO_CHAR(SALARY, '$99,999.00') SALARY FROM EMPLOYEES

/* ADD_MONTHS, NEXT_DAY, LAST_DAY */

/* 
1. Print the hire date in the format "01-Jan-2022"
2. Print last name, hire date in the format, "1st of jan 2022" */

SELECT LAST_NAME,TO_CHAR(HIRE_DATE, 'DD-MON-YYYY')
FROM EMPLOYEES
WHERE HIRE_DATE < TO_DATE('01-JAN-08', 'DD-MON-RR')


/* 1. Envelope printing restricts the addressee field to 16 characters. Ideally, 
the addressee field contains employees’ FIRST_NAME and LAST_NAME values separated by a 
single space. When the combined length of an employee’s FIRST_NAME and LAST_NAME exceeds 15 characters, 
the addressee field should contain their formal name. An employee’s formal name is made up of the 
first letter of their FIRST_NAME and the first 14 characters of their LAST_NAME. You are required to retrieve 
a list of FIRST_NAME and LAST_NAME values and formal names for employees where the combined length of FIRST_NAME 
and LAST_NAME exceeds 15 characters. 

2. Write a Query that displays the employee number, hire date, number of months employed, six-month review date, 
first Friday after hire date, and the last day of the hire month for all employees 
who have been employed for fewer than 150 months and working for department 50  */

/* NESTING FUNCTIONS */

SELECT LAST_NAME, UPPER(CONCAT(FIRST_NAME, JOB_ID))
FROM EMPLOYEES

/* NVL, NVL2, NULL IF, COALESCE */

SELECT LAST_NAME, SALARY, COMMISSION_PCT, NVL(COMMISSION_PCT,0),SALARY+10+COMMISSION_PCT, (SALARY+100+NVL(COMMISSION_PCT,0))
FROM EMPLOYEES

SELECT LAST_NAME, SALARY, COMMISSION_PCT, NVL2(COMMISSION_PCT,'SAL+COMM','SAL')INCOME
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (60,80,90)

SELECT FIRST_NAME, LENGTH(FIRST_NAME) "EXPR1", LAST_NAME, LENGTH(LAST_NAME) "EXPR2", NULLIF(LENGTH(FIRST_NAME), LENGTH(LAST_NAME)) RESULT
FROM EMPLOYEES

SELECT LAST_NAME, FIRST_NAME, SALARY, COMMISSION_PCT, COALESCE(SALARY+(COMMISSION_PCT*SALARY), SALARY+2000,SALARY)"NEW SALARY"
FROM EMPLOYEES

SELECT LAST_NAME, COMMISSION_PCT, MANAGER_ID, COALESCE(TO_CHAR(COMMISSION_PCT), TO_CHAR(MANAGER_ID)) "NO COMMISSION AND MANAGER"
FROM EMPLOYEES

/* CONDITIONAL EXPRESSIONS */

/* CASE EXPRESSIONS */

SELECT LAST_NAME, JOB_ID,  SALARY,
CASE JOB_ID WHEN 'IT_PROG' THEN (0.10*SALARY)+SALARY
            WHEN 'SA_REP' THEN (0.20*SALARY)+SALARY
            WHEN 'ST_CLERK' THEN (0.05*SALARY)+SALARY
ELSE SALARY END "REVISED SALARY"
FROM EMPLOYEES

/* DECODE */

SELECT LAST_NAME, JOB_ID, SALARY,
DECODE(JOB_ID, 'IT_PROG', 0.10*SALARY, 
               'SA_REP',0.20*SALARY,
               'ST_CLERK',0.05*SALARY, SALARY) "REVISED SALARY"
FROM EMPLOYEES

SELECT SALARY, LAST_NAME,
(CASE WHEN SALARY<=10000 THEN 'LOW'
WHEN SALARY BETWEEN 10000 AND 20000 THEN 'AVG'
WHEN SALARY>=20000 THEN 'HIGH'
ELSE 'UNKNOWN' END) SALARY
FROM EMPLOYEES

/* DECODE CAN ONLY EVALUATE FOR EQUALITY OPERATOR, DECODE IS A FUNCTION, CASE IS A STATEMENT, DECODE RETURNS TRUE IF YOU COMPARE NULL TO NULL

/*
1. You are required to return a set of rows from the EMPLOYEES table with DEPARTMENT_ID values of 100. 
The set must also contain FIRST_NAME and LAST_NAME values and an expression aliased as NAME_LENGTHS. 
This expression must return the string 'Different Length' if the length of the FIRST_NAME differs from that of the LAST_NAME, 
else the string 'Same Length' must be returned.

2.You are requested to query the LOCATIONS table for rows with the value US in the COUNTRY_ID column. 
An expression aliased as LOCATION_INFO is required to evaluate the STATE_PROVINCE column values and 
returns different information as per the following table. Sort the output based on the LOCATION_INFO expression.

If State _Province Is	The Value Returned Is   
Washington	 ‘Headquarters’
Texas	Oil Wells
California	City
New Jersey 	Street)Address */

/* GROUP & AGGREGATION FUNCTIONS */
/* GROUP FUNCTIONS IGNORES NULL VALUES */
/* AVG, COUNT, DISTINCT, SUM, MIN, MAX */

Select Round(Avg(Salary)), Max(Salary), Min(Salary) 
From Employees
Where Job_Id Like '%REP%'

Select Min(Hire_Date), Max(Hire_Date)
From Employees

Select Count(*)
From Employees
Where Department_Id = 90

Select Count(NVL(Commission_Pct,0))
From Employees
Where Department_Id = 90

SELECT COMMISSION_PCT
FROM EMPLOYEES
WHERE DEPARTMENT_ID=90

Select * From Employees
Where Department_Id = 100

SELECT AVG(COMMISSION_PCT)
FROM EMPLOYEES

Select Avg(Nvl(Commission_Pct,0))
From Employees

Select Count(Distinct Department_Id)
From Employees

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES

SELECT DEPARTMENT_ID, AVG(SALARY), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
GROUP BY(DEPARTMENT_ID)
ORDER BY MAX(SALARY) DESC

SELECT AVG(SALARY), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
GROUP BY(DEPARTMENT_ID)
ORDER BY MAX(SALARY) DESC

SELECT DEPARTMENT_ID, AVG(SALARY), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP','AD_PRES','IT_PROG')
GROUP BY(DEPARTMENT_ID)
ORDER BY MAX(SALARY) DESC

/* ALL COLUMNS IN THE SELECT LIST THAT ARE NOT A GROUP FUNCTION MUST BE IN THE GROUP BY CLAUSE */

select count(department_id), avg(salary)
from employees

select avg(salary)
from employees
group by (department_id)

select department_id, avg(salary)
from employees
group by (department_id)

select department_id, job_id, avg(salary)
from employees
group by department_id, job_id

select department_id, COUNT(job_id), count(last_name)
from employees
group by department_id

/* WHERE CLAUSE CANNOT BE USED TO RESTRICT GROUPS */

select department_id, avg(salary)
from employees
where avg(salary)>10000
group by department_id

/* HAVING */

select department_id, avg(salary)
from employees
group by department_id
having avg(salary)>10000

select department_id, avg(salary)
from employees
where salary>10000
group by department_id

/* ROWS ARE GROUPED, GROUP FN IS APPLIED, GROUPS MATCHING HAVING CLAUSE IS DISPLAYED */

select department_id, avg(salary) "avg_salary"
from employees
group by (department_id)
order by "avg_salary" desc

select department_id, avg(salary)
from employees
where department_id in(50,60,80,90)
group by(department_id)
having avg(salary)>5000

* ACTIVITIES 

1)	The company is planning a recruitment drive and wants to identify the days of the week on which 2 or more staff members were hired. 
Your report must list the days and the number of employees hired on each of them.

2) Analysis of staff turnover is a common reporting requirement. You are required to create a report containing the number of 
employees who left their jobs, grouped by the year in which they left. The jobs they performed are also required. 
The results must be sorted in descending order based on the number of employees in each group.
The report must list the year, the JOB_ID, and the number of employees who left a particular job in that year.

3) Calculate the average length of all the country names. Any fractional components must be rounded to the nearest whole number. */

/* JOINS & SUBQUERIES */

/* PURE NATURAL JOINS, USING CLAUSE, ON, OUTER JOINS */

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, CITY
FROM DEPARTMENTS
NATURAL JOIN LOCATIONS

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, D.LOCATION_ID, CITY
FROM DEPARTMENTS D,LOCATIONS L
WHERE (D.LOCATION_ID = L.LOCATION_ID)

SELECT * FROM LOCATIONS
SELECT * FROM DEPARTMENTS
SELECT * FROM EMPLOYEES

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, CITY
FROM DEPARTMENTS
NATURAL JOIN LOCATIONS
WHERE DEPARTMENT_ID IN (50,60,80)

SELECT * FROM EMPLOYEES
NATURAL JOIN DEPARTMENTS

SELECT * FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 

/* T1 --> DEPT_ID, MANAGER_ID, C, D
T2 --> DEPT_ID,MANAGER_ID,X,Y

T1&T2 (NJ) -->  (T1.DEP_ID = T2.DEP_ID) AND (T1.MANAGER_ID = T2.MANAGER_ID)
*/

/* USING CLAUSE */

SELECT * 
FROM EMPLOYEES 
JOIN DEPARTMENTS
USING (DEPARTMENT_ID)
WHERE DEPARTMENT_ID = 80

/* COMMON COLUMNS THAT ARE NOT USED IN THE "USING" CLAUSE MUST BE ALIASED */

SELECT LAST_NAME, DEPARTMENT_ID, E.MANAGER_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
USING (DEPARTMENT_ID)
WHERE DEPARTMENT_ID = 80

/* DO NOT ALIAS THE COLUMN USED IN THE USING CLAUSE */

SELECT LAST_NAME, DEPARTMENT_ID, E.MANAGER_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
USING (DEPARTMENT_ID)
WHERE D.DEPARTMENT_ID = 80

/* ON CLAUSE */

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME,LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE D.DEPARTMENT_ID IN (60,80,90)

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME,LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
AND D.DEPARTMENT_ID IN (60,80,90)

/* USING CLAUSE CAN ONLY BE USED TO JOIN COLUMNS WITH SAME NAMES */
/* IN ON CLAUSE COLUMN NAMES CAN BE DIFFERENT */

/* SELECT A, B, C
FROM T1 JOIN T2
USING (B)

SELECT T1.A, T1.B,T2.C
FROM T T1 JOIN TB T2
ON (T1.B = T2.C) */

SELECT * FROM EMPLOYEES
JOIN DEPARTMENTS
USING (DEPARTMENT_ID)

SELECT * FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)

SELECT * FROM DEPARTMENTS

/* SELF JOINS */

SELECT E.FIRST_NAME, E.LAST_NAME, MGR.FIRST_NAME, MGR.LAST_NAME
FROM EMPLOYEES E JOIN EMPLOYEES MGR
ON (E.MANAGER_ID = MGR.EMPLOYEE_ID)

/* NON-EQUI JOINS */

SELECT E.LAST_NAME, E.SALARY, J.JOB_TITLE
FROM EMPLOYEES E JOIN JOBS J
ON E.SALARY BETWEEN J.MIN_SALARY AND J.MAX_SALARY

SELECT * FROM JOBS

/* CROSS JOINS */

SELECT EMPLOYEE_ID, DEPARTMENT_NAME
FROM EMPLOYEES
CROSS JOIN DEPARTMENTS

/* OUTER JOINS */

SELECT LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
RIGHT OUTER JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

/* 1. Fetch the EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID, LAST_NAME, HIRE_DATE, and END_DATE values for all rows retrieved 
using a pure natural join. Alias the EMPLOYEES table

2. Produce a report with one column aliased as Managers. with each row containing a sentence of the format 
FIRST_NAME LAST_NAME is manager of the DEPARTMENT_NAME

3) you are required to retrieve the DEPARTMENT_NAME and DEPARTMENT_ID values for those departments to which no employees are 
currently assigned

4. You are required to retrieve the employee’s LAST_NAME, EMPLOYEE_ID, manager’s LAST_NAME, and employee’s DEPARTMENT_ID 
for the rows with DEPARMENT_ID values of 10, 20, or 30. Alias the EMPLOYEES table as E and the second instance of the EMPLOYEES 
table as M. Sort the results based on the DEPARTMENT_ID column */


































