SELECT
  count(*),
  -- count  计数只记值不为空的个数
  min(COMM),
  max(COMM),
  -- count，min，max在计算时都不计算空值
  avg(COMM),
  sum(COMM)
FROM scott.emp;

SELECT
  deptno,
  max(SAL)
FROM scott.emp
GROUP BY DEPTNO; -- 把每个部门分为一组，再查询每个部门的最大工资


-- 数字函数

SELECT abs(-769); -- 返回绝对值
SELECT bin(3); -- 返回二进制
SELECT oct(8); -- 返回八进制
SELECT hex(17); -- 返回16进制
SELECT ceiling(1.00003); -- 返回大于次数的整数，向上取整
SELECT floor(1.99999); -- 向下取整
SELECT round(1.46666); -- round 约等于  四舍五入
SELECT MOD(3455, 1200); -- 取模运算
SELECT pi(); -- 圆周率
SELECT rand(); -- 返回0-1 之间随机数
SELECT truncate(1234.678, 2); -- 2 代表小数点后面几位小数

-- 字符串函数
SELECT ascii('a'); -- 返回ASCII 码值
SELECT bit_length('asdf'); -- 返回一共多少字节，一个字符8个字节
SELECT concat('hello', 'world', '!'); -- 字符串拼接
SELECT length('hello'); -- 查看字符个数
SELECT locate('e', 'hello'); -- 返回子串第一次出现时的位置

#日期和时间函数

SELECT CURDATE(); -- CURDATE()或 CURRENT_DATE()  返回当前的日期
SELECT current_time; -- 返回当前时间
SELECT now(); -- 返回当前时刻，有年月日时分秒
SELECT date_add(now(), INTERVAL 31 DAY); -- 当前时间加上31天
SELECT date_sub(now(), INTERVAL 31 DAY); -- 当前时间减去31天
SELECT dayofweek(now()); -- 返回今天是一星期中的第几天
SELECT dayofyear(now()); -- 返回今天是一年中的第几天
SELECT dayname(now()); -- 返回今天的星期名
SELECT week(now()); -- 返回当前一星期是一年中的第几周

-- index  索引
CREATE INDEX idx_email
  ON db_1702.csdn (email); -- 为csdn的email创建索引

CREATE INDEX idx_usename
  ON db_1702.csdn (username);

CREATE INDEX idx_password
  ON db_1702.csdn (password);

DROP INDEX idx_email
ON db_1702.csdn; -- 删除索引

SHOW INDEX FROM db_1702.csdn; -- 显示索引

SELECT *
FROM db_1702.csdn
WHERE username = 'zdg';

-- 排名前十的密码
SELECT password
FROM db_1702.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10;

-- 排名前十的邮箱
SELECT substr(email, locate('@', email) + 1)
FROM db_1702.csdn
ORDER BY count(substr(email, locate('@', email) + 1)) DESC
LIMIT 10;

-- 查询平均工资多于2000的部门
SELECT
  deptno,
  avg(SAL)
FROM scott.emp -- 分组查询一般都和聚合函数有关
GROUP BY DEPTNO -- 有 HAVING 一定是分组查询
HAVING avg(SAL) > 2000; -- HAVING 组检索   where 是 行检索


-- 用户名和邮箱名相同的数据
SELECT *
FROM db_1702.csdn
WHERE username = substr(email, 1, locate('@', email) - 1);


SELECT email
FROM db_1702.csdn;

-- 各列值的快速模糊查询
SELECT *
FROM db_1702.csdn
WHERE email LIKE '%tester@qq.com%';

SELECT *
FROM db_1702.csdn
WHERE password LIKE '%li123456li%';

SELECT *
FROM db_1702.csdn
WHERE username LIKE '%tengfei%';
-- 排名前十的密码
-- 排名前十的邮箱
-- 用户名和邮箱名相同的数据
-- 密码可能是生日的数据
SELECT count(*) -- 378776
FROM db_1702.csdn
WHERE password REGEXP '^19[0-9]{2}0[1-9]{1}[0-3]{1}[0-9]{1}$' -- 235782
UNION
SELECT count(*)
FROM db_1702.csdn
WHERE password REGEXP '^19[0-9]{2}1[0-2]{1}[0-3]{1}[0-9]{1}$'; -- 142994
-- 哪一年出生的用户最多
CREATE VIEW v_password
AS
  SELECT password -- 378776
  FROM db_1702.csdn
  WHERE password REGEXP '^19[0-9]{2}0[1-9]{1}[0-3]{1}[0-9]{1}$'
  UNION ALL
  SELECT password
  FROM db_1702.csdn
  WHERE password REGEXP '^19[0-9]{2}1[0-2]{1}[0-3]{1}[0-9]{1}$';

SELECT
  substr(password, 1, 4),
  count(*)
FROM db_1702.v_password
GROUP BY 1
ORDER BY 2 DESC ;

-- 哪个星座的用户最多
SELECT count(*)
FROM db_1702.v_password
WHERE substr(password,5,4) BETWEEN '0321' AND '0420'
 ;


-- 密码是 QQ 号的
-- 密码是手机号的
-- 哪个运营商的用户最多
-- 弱密码用户数据

SHOW FULL COLUMNS FROM scott.dept;