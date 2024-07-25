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



























