SELECT *
FROM scott.emp;

SHOW TABLE STATUS FROM scott
WHERE name ='emp';

SELECT *
FROM scott.emp
LIMIT 7 OFFSET 6;  -- OFFEST 后面是起始位置  LIMIT 后面是每次查询几个

SELECT *
FROM scott.emp
ORDER BY ENAME  -- ORDER 排序
LIMIT 3 OFFSET 0;

SELECT *
FROM scott.emp
WHERE ENAME LIKE 'A___S'; -- % 代表任意字符，任意长度  _ 代替个数为1的 任意字符

SELECT *
FROM scott.emp
WHERE HIREDATE RLIKE '-05-'; -- 查询入职日期是五月份的员工

SELECT *
FROM scott.emp
WHERE DEPTNO IN (10,20,30);

SELECT *
FROM scott.emp
WHERE JOB IN ('president ') ;

SELECT ENAME AS '员工姓名',SAL AS '员工工资'  -- as 为字段添加别名
FROM scott.emp AS 表名 ; -- 为表起别名

SELECT ENAME,SAL + ifnull(COMM,0)  -- comm的值如果为空的话就取0这个值。如果不为空就去comm本身
FROM scott.emp;

UPDATE scott.emp
    SET DEPTNO = NULL
WHERE ENAME = 'allen'; -- 修改allen 所在的部门为空

SELECT *
FROM scott.emp
WHERE DEPTNO IN (10,30);   -- in 语句

SELECT *
FROM scott.emp
WHERE SAL BETWEEN 1000 AND 2000;  -- between and 闭区间 在1000到2000的范围，包括1000和2000