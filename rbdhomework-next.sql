SELECT * from EMP;
SELECT  * from DEPT;
SELECT  * from SALGRADE;

/*Zadadnie 3.1*/
SELECT ENAME, HIREDATE
from emp e
where HIREDATE = (Select max(HIREDATE) from EMP ee where e.DEPTNO = ee.DEPTNO);
/*Zadanie 3.2*/
---
/*Zadanie 3.3*/
SELECT ENAME, JOB, SAL
from EMP
where DEPTNO = 30 and JOB = 'CLERK';
/*Zadanie 3.4*/
select ENAME, SAL
from EMP
where SAL > (select max(SAL) from emp, DEPT where emp.DEPTNO = DEPT.DEPTNO and DNAME = 'SALES');
/*Zadanie 3.5*/
SELECT e.ENAME, e.SAL, e.JOB, e.HIREDATE, d.DNAME
FROM emp e, DEPT d, SALGRADE s
where e.SAL between s.LOSAL and s.HISAL and s.GRADE = 2 and e.DEPTNO = d.DEPTNO;
/*Zadanie 3.6*/
---
/*Zadanie 3.7*/
SELECT ENAME, SAL, JOB, GRADE
from emp, SALGRADE
where SALGRADE.GRADE = ();

/*Zadanie 4.1*/
SELECT ENAME, JOB, SAL
from EMP
WHERE SAL IN (Select MAX(SAL) FROM DEPT GROUP BY EMP.DEPTNO);
/*Zadanie 4.2*/
SELECT *
FROM EMP a
WHERE HIREDATE = (Select MAX(HIREDATE) from EMP b where a.deptno = b.DEPTNO)
order by HIREDATE;
/*Zadanie 4.3*/
SELECT *
from EMP a
WHERE SAL > (select avg(SAL) FROM EMP b where a.DEPTNO = b.DEPTNO);
/*Zadanie 4.4*/
SELECT *
from EMP
where MGR is null ;
/*Zadanie 4.5*/
SELECT *
from EMP
where SAL > (select max(SAL) from EMP, DEPT where EMP.DEPTNO = DEPT.DEPTNO);
/*Zadanie 4.6*/
SELECT ENAME, SAL
from EMP e
where 3 > (select count(*) from EMP where e.SAL < emp.SAL);
/*Zadanie 4.7*/
SELECT ENAME, SAL
from emp e
where 4 > (select distinct count(*) from emp where e.SAL > EMP.SAL)
/*Zadanie 4.8*/

/*Zadanie 4.9*/
SELECT ename, hiredate, '  *  ' MAXDATE
FROM emp
WHERE hiredate = (SELECT MAX (hiredate) FROM emp) UNION
SELECT ename, hiredate, '     ' maxdate
FROM emp
WHERE hiredate NOT IN
(SELECT MAX(hiredate)
FROM emp);


/*Zadania 4*/

/*
2. Wybierz nazwiska, zarobki i datę zatrudnienia pracowników zatrudnionych najpóźniej i najwcześniej.

3. Wybierz nazwiska, stanowiska i zarobki pracowników z działu 30 zarabiających tyle samo, co WARD.

6. Wybierz nazwiska, zarobki, stanowiska i klasę zarobkową pracowników, którzy mają tego samego kierownika, co WARD.

Wskaż dla każdego działu ostatnio zatrudnionych pracowników. Uporządkuj według dat zatrudnienia.
*/
