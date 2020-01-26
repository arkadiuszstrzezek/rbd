/*
Wybierz nazwiska wszystkich pracowników wraz z numerami i nazwami departamentów w których są zatrudnieni.
*/
SELECT e.ENAME, d.DNAME, d.DEPTNO
from EMP e, DEPT d
where e.DEPTNO = d.deptno
order by ename;
/*
Dla pracowników o miesięcznej pensji  powyżej 1500 podaj ich nazwiska, miejsca usytuowania ich departamentów oraz nazwy tych departamentów.
*/
SELECT e.ENAME, d.loc, d.dname
from emp e, dept d
where e.SAL > 1500 and e.DEPTNO = d.DEPTNO;
/*
Utwórz listę pracowników podając ich nazwisko, zawód, pensję i stopień zaszeregowania
*/
SELECT e.ename, e.job, e.SAL, s.GRADE
from emp e, SALGRADE s
where e.SAL between s.LOSAL and s.HISAL;
--lista pracowników zawód pensja i stopien zszceregowania
select *
from SALGRADE;
/*Wypisz stanowiska występujące zarówno w dziale 10 jak w dziale 30 */
SELECT JOB
from EMP
where DEPTNO = 10
intersect
select JOB
from EMP
where DEPTNO = 20;
/*Zapytania sumaryczne*/
/*Oblicz średni zarobek w firmie*/
select avg(SAL)
from EMP ;
/*znajdz minimalne zarobki na stanowisku clerk*/
select min(SAL)
from EMP
where JOB = 'CLERK';
SELECT max(SAL)
from EMP
where job = 'Clerk';
/*Obliczyć średnie zarobki na każdym ze stanowisk pracy*/
select job, avg(SAL)
from EMP
group by job;
/*Znajdź ilu pracowników zatrudniono w departamencie 20. */
select  count(*)
from EMP
where DEPTNO = 20;
/*Obliczyć średnie zarobki na każdym ze stanowisk pracy z wyjątkiem stanowiska MANAGER. */
SELECT job, avg(SAL)
from EMP
where JOB != 'Manager'
group by job;






