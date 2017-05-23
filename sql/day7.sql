CREATE VIEW scott.v_emp
AS
  SELECT
    JOB,
    HIREDATE,
    SAL
  FROM scott.emp
  WHERE DEPTNO = 20;

USE scott;
SHOW TABLES ;

DROP VIEW v_emp;
SELECT *
FROM v_emp;

UPDATE scott.emp
SET HIREDATE = '1981-5-1'
WHERE JOB = 'manager';

DROP TABLE IF EXISTS scott.emp_test;
CREATE TABLE scott.emp_test
  SELECT *                  -- 通过查询一个表，来创建一个新的表
  FROM scott.emp;   -- 并且这个表的数据和基表一样的

SELECT *
FROM scott.emp_test;

INSERT INTO scott.emp_test(scott.emp_test.ENAME)
  SELECT ENAME
  FROM scott.emp;    -- 通过查询一个表来添加一条字段