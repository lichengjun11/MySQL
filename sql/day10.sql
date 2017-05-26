SELECT
  count(*),   -- count  计数只记值不为空的个数
  min(COMM),
  max(COMM),   -- count，min，max在计算时都不计算空值
  avg(COMM),
  sum(COMM)
FROM scott.emp;

SELECT deptno,max(SAL)
FROM scott.emp
GROUP BY DEPTNO;    -- 把每个部门分为一组，再查询每个部门的最大工资


-- 数字函数

SELECT abs(-769);   -- 返回绝对值
SELECT bin(3);   -- 返回二进制
SELECT oct(8);  -- 返回八进制
SELECT hex(17);   -- 返回16进制
SELECT ceiling(1.00003);   -- 返回大于次数的整数，向上取整
SELECT floor(1.99999);  -- 向下取整
SELECT round(1.46666);  -- round 约等于  四舍五入
SELECT MOD(3455,1200);  -- 取模运算
SELECT pi();  -- 圆周率
SELECT rand();  -- 返回0-1 之间随机数
SELECT truncate(1234.678,2);   -- 2 代表小数点后面几位小数

-- 字符串函数
SELECT ascii('a');  -- 返回ASCII 码值
SELECT bit_length('asdf');  -- 返回一共多少字节，一个字符8个字节
SELECT concat('hello','world','!');  -- 字符串拼接
SELECT length('hello');   -- 查看字符个数
SELECT locate('e','hello');  -- 返回子串第一次出现时的位置

-- 排名前十的密码
SELECT password
FROM db_1702.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10;

-- 排名前十的邮箱
SELECT substr(email,locate('@',email)+1)
FROM db_1702.csdn
GROUP BY substr(email,locate('@',email)+1)
ORDER BY count(substr(email,locate('@',email)+1)) DESC
LIMIT 10;

-- 查询平均工资多于2000的部门
SELECT deptno,avg(SAL)
FROM scott.emp          -- 分组查询一般都和聚合函数有关
GROUP BY DEPTNO           -- 有 HAVING 一定是分组查询
HAVING avg(SAL) > 2000;  -- HAVING 组检索   where 是 行检索


-- 用户名和邮箱名相同的数据

SELECT email
FROM db_1702.csdn;
