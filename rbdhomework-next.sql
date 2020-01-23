SELECT * from EMP;
SELECT  * from DEPT;
SELECT  * from SALGRADE;

/*Zadanie 1.1 */
SELECT ENAME, SAL
from EMP;
/*Zadanie 1.2*/
SELECT DNAME, LOC
from DEPT
where LOC = 'DALLAS';
/*Zadanie 1.3*/
SELECT DISTINCT  ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1000;
/*Zadanie 1.4*/
SELECT ENAME, JOB, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = '20' AND JOB = 'CLERK';
/*Zadanie 1.5*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'TH' AND 'LL';
/*Zadanie 1.6*/
SELECT ENAME, JOB, SAL
from EMP
where MGR is not null ;
/*zadanie 1.7*/
SELECT ENAME, (SAL*12 + NVL(COMM,0)) "roczna"
from EMP
ORDER BY ENAME;
/*Zadanie 1.8*/
SELECT ENAME, DNAME, EMP.DEPTNO
FROM EMP
INNER JOIN DEPT on emp.DEPTNO = DEPT.DEPTNO;
/*Zadanie 1.9*/
SELECT ename, loc, dname
from EMP, DEPT
WHERE SAL > 1500;
/*Zadanie 1.10*/
select ENAME, SAL, GRADE
from EMP, SALGRADE;
/*Zadanie 1.11*/
--- ?
/*Zadanie 1.12*/
-- ?
/*Zadanie 1.13*/
---
/*Zadanie 1.14*/
SELECT HIREDATE, JOB
from EMP
where HIREDATE like '82%' OR HIREDATE like '83%';
/*Zadanie 1.15*/
---
/*Zadanie 1.16*/
--
/*Zadanie 1.16*/
---

/*Zadanie 2.1*/
SELECT MIN(SAL) AS MINIMUM
from EMP;
/*Zadanie 2.2*/
--
/*Zadanie 2.3*/
SELECT job, COUNT(*), SUM(sal), ROUND(AVG(sal), 2), MIN(sal), MAX(sal)
FROM emp
GROUP BY job;
/*Zadanie 2.4*/
SELECT AVG(SAL) Avsal, AVG(sal*12 + NVL(COMM,0))avcomp
from EMP
group by JOB;
/*Zadanie 2.5*/
SELECT max(SAL) - min(SAL) DIFFERENCE
FROM EMP;
/*Zadanie 2.6*/
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3;
/*Zadanie 2.7*/
---
/*Zadanie 2.8*/
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING count(*) >= 2;
/*Zadanie 2.9*/
SELECT dept.deptno, dname, loc
FROM dept
INNER JOIN emp
ON emp.deptno = dept.deptno
GROUP BY dept.deptno, dname, loc
HAVING COUNT(*) >= 4;
/*Zadanie 2.10*/
SELECT max(SAL), DNAME
FROM EMP, DEPT
GROUP BY DNAME;

/*Zadadnie 3.1*/
SELECT ENAME, HIREDATE
from emp e
where HIREDATE = (Select max(HIREDATE) from EMP ee where e.DEPTNO = ee.DEPTNO);
/*Zadanie 3.2*/
---
/*Zadanie 3.3*/
---
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
6. Wskaż trzech najlepiej zarabiających pracowników w firmie. Podaj ich nazwiska i pensje.

7. Wybierz 4 pracowników o najniższych zarobkach. Zwróć uwagę na powtarzające się zarobki.

8. Wybierz pracowników, którzy mają więcej niż 2 podwładnych.

9. Napisz zapytanie generujące listę pracowników, tak, aby przy nazwisku ostatnio zatrudnionego, w kolumnie MAXDATE była *. Oprócz kolumny MAXDATE podaj nazwiska i datę zatrudnienia.
*/
/*
1. Wybierz pracowników zatrudnionych najpóźniej. Podaj nazwisko i datę zatrudnienia.

2. Wybierz nazwiska, zarobki i datę zatrudnienia pracowników zatrudnionych najpóźniej i najwcześniej.

3. Wybierz nazwiska, stanowiska i zarobki pracowników z działu 30 zarabiających tyle samo, co WARD.

4. Wybierz nazwiska i zarobki pracowników, którzy zarabiają więcej od któregokolwiek pracownika z działu SALES.

5. Wybierz nazwiska, zarobki i datę zatrudnienia pracowników, którzy są zatrudnieni później od każdego z pracowników z klasy zarobkowej 2.

6. Wybierz nazwiska, zarobki, stanowiska i klasę zarobkową pracowników, którzy mają tego samego kierownika, co WARD.

7. Wybierz nazwiska, zarobki, stanowiska i klasę zarobkową pracowników, którzy są w tej samej klasie zarobkowej, co SMITH.

8. Znajdź pracowników zarabiających maksymalną pensję na ich stanowiskach pracy. Podaj nazwiska, zarobki i stanowiska.

Wskaż dla każdego działu ostatnio zatrudnionych pracowników. Uporządkuj według dat zatrudnienia.
*/
