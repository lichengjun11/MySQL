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

