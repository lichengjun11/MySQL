-- 事务
SELECT *
FROM scott.emp;

START TRANSACTION ;  -- 开启事务

INSERT INTO scott.emp(EMPNO,ENAME)
VALUES (111,'asdfgh');

DELETE FROM scott.emp
    WHERE EMPNO = 111;

UPDATE scott.emp
    SET SAL = SAL - 3000
WHERE ENAME = 'king';

UPDATE scott.emp
    SET SAL = SAL + 3000
WHERE ENAME = 'ward';

COMMIT ;    -- 提交，结束事务

ROLLBACK ;    -- 回滚   回到事务开始之初

START TRANSACTION ;

  CREATE OR REPLACE VIEW scott.wwe
    AS
    SELECT EMPNO,ENAME,JOB
    FROM scott.emp
WHERE EMPNO = 123 OR EMPNO = 111;

SHOW FULL TABLES IN scott
WHERE table_type LIKE 'view';   -- 查询是不是视图

SHOW CREATE VIEW scott.wwe; -- 显示建视图语句

SELECT *
FROM scott.wwe;


SELECT *
FROM scott.dept;

CREATE VIEW scott.v_emp_10
  AS
  SELECT *
  FROM scott.emp
WHERE DEPTNO = 10;

SHOW FULL TABLES IN scott
WHERE table_type LIKE 'view';

SHOW FULL TABLES IN scott;  -- 查看scott数据库的所有表和视图

DROP VIEW scott.v_emp_10;

DESC scott.dept;  -- desc descride  描述一个表的结构
SHOW FULL COLUMNS FROM scott.dept;   -- 显示字段每个字段的信息 包括注释
SHOW TABLE STATUS FROM scott;   -- 显示每个表的信息 包括注释
SHOW CREATE TABLE scott.emp;  -- 显示建表语句
SHOW CREATE VIEW scott.v_emp_10;  -- 显示建视图语句


SELECT *
FROM scott.emp
WHERE DEPTNO = 30 AND JOB = 'manager';  -- 显示emp表中即在30部门中又同时是经理的人

CREATE OR REPLACE VIEW scott.v_emp_dept
  AS
  SELECT e.ENAME,d.DNAME
  FROM scott.emp e LEFT JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO;                     -- OR REPLACE 创建或更新，如果有这个视图就是更新，如果没有就是创建

SELECT *
FROM scott.v_emp_dept;

UPDATE scott.v_emp_dept
    SET scott.v_emp_dept.ENAME = 'scott new'
WHERE scott.v_emp_dept.ENAME = 'scott';

CREATE VIEW scott.v_max
  AS
  SELECT max(SAL) max_sal
  FROM scott.emp;

SELECT *
FROM scott.v_max;

UPDATE scott.v_max
    SET max_sal = 6000;    -- 因为max是函数，所以这个视图不能更改

CREATE OR REPLACE VIEW scott.v_union
  AS
  SELECT ENAME
  FROM scott.emp
WHERE DEPTNO = 10

  UNION

  SELECT ENAME
  FROM scott.emp
WHERE DEPTNO = 20;

SELECT *
FROM scott.v_union;

UPDATE scott.v_union
    SET scott.v_union.ename = 'SCOTT'
WHERE scott.v_union.ENAME = 'scott new';  -- 这个视图有union并集，也不能修改

   --  嵌套  sub-query
SELECT *
FROM scott.emp  -- 主查询
WHERE SAL > (  -- 子查询
  SELECT SAL
  FROM scott.emp
WHERE ENAME = 'scott new'  -- 相关子查询
);

SELECT EMPNO,ENAME
FROM scott.emp AS e
WHERE SAL > (
  SELECT avg(SAL)
  FROM scott.emp
WHERE e.DEPTNO = e.DEPTNO   -- 非相关子查询
);


-- transaction   事务  DDL 语句隐式关闭事务
-- save point  保留点

START TRANSACTION ;-- 开启事务
UPDATE scott.emp
    SET ENAME = 'allen one'
WHERE EMPNO = 7499;

SAVEPOINT a;

DELETE FROM scott.emp
WHERE EMPNO = 111;

SAVEPOINT b;

INSERT INTO scott.emp (EMPNO,ENAME)
    VALUE (869,'宋小宝');

SAVEPOINT c;

DELETE FROM scott.emp;

COMMIT ;
ROLLBACK to a   ;

SELECT *
FROM scott.emp;

