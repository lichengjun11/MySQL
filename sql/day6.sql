USE db_1702;
SHOW TABLES;
SHOW DATABASES;
SHOW FULL COLUMNS FROM scott.emp;
SHOW FULL COLUMNS FROM scott.dept;
SHOW FULL COLUMNS FROM scott.salgrade;

SELECT *
FROM scott.emp;


-- 1.返回拥有员工的部门名部门号
SELECT
  DISTINCT
  d.DEPTNO,d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO;


-- 2.工资多于scott的员工信息
SELECT *
FROM scott.emp
WHERE SAL + ifnull(COMM,0) > (
  SELECT SAL+ifnull(COMM,0)
  FROM scott.emp
WHERE ENAME = 'scott'
);


-- 3.返回员工和所属经理的姓名
SELECT
  e.ENAME  员工姓名,
  e2.ENAME 经理姓名
FROM scott.emp e LEFT JOIN scott.emp e2    -- 自连接
    ON e.MGR = e2.EMPNO;

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
SELECT e.ENAME,e2.ENAME
FROM scott.emp e JOIN scott.emp e2
ON e.MGR = e2.EMPNO
WHERE e.HIREDATE < e2.HIREDATE;

-- 5.返回员工姓名及其所在的部门名称
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

# 6.返回从事 clerk 工作的员工姓名和所在部门名称

SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
WHERE JOB = 'clerk';

-- 7.返回部门号及其本部门的最低工资
SELECT DEPTNO,min(SAL + ifnull(COMM,0))
FROM scott.emp
GROUP BY DEPTNO;

-- 8.返回销售部 sales 所有员工的姓名
SELECT e.ENAME
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
WHERE d.DNAME = 'sales';    -- 方案 1

SELECT ENAME
FROM scott.emp
WHERE DEPTNO = (
  SELECT DEPTNO
  FROM scott.dept
  WHERE DNAME = 'sales'    -- 方案 2
);
-- 9.返回工资多于平均工资的员工
SELECT *
FROM scott.emp
WHERE SAL + ifnull(COMM, 0) > (
  SELECT avg(SAL + ifnull(COMM, 0))
  FROM scott.emp
);

-- 10.返回与 scott 从事相同工作的员工?
SELECT e1.*
FROM scott.emp e1
  JOIN scott.emp e2
    ON e1.JOB = e2.JOB
WHERE e2.ENAME = 'scott'; -- 方案 1

SELECT *
FROM scott.emp
WHERE JOB = (
  SELECT JOB
  FROM scott.emp
WHERE ENAME = 'scott'    -- 方案 2
);
-- 返回员工的姓名，所在部门及其工资
SELECT
  e.ENAME,
  e.SAL + ifnull(COMM, 0),
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

-- 返回员工的详细信息，包括部门名
SELECT
  DISTINCT *
FROM scott.emp e INNER JOIN scott.dept d
WHERE e.DEPTNO = d.DEPTNO;

-- 所有学生获得总学分？
-- 课有哪些学生选?
-- 所有学生获得的总学分？
