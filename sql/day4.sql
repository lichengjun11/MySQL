SHOW FULL COLUMNS FROM db_1702.student;

SELECT *
FROM db_1702.student;

INSERT INTO db_1702.student(age)
    VALUES (20),(30),(40);

INSERT INTO db_1702.student(age,gender,name)
    VALUES (20,'M','蒋欣'),(30,'M','刘翔'),(600,'M','火星人');

SHOW CREATE TABLE db_1702.student; -- 显示建表语句

UPDATE db_1702.student
    SET height = 1.8,name = '李四';-- 修改所有的身高和姓名

UPDATE db_1702.student
    SET intro = '风流倜傥，人见人爱的李四' -- 只修改id为2的intro
WHERE id = 2;

UPDATE db_1702.student
    SET name = '王五',intro = '美丽动人', gender = '女', age = '40',height = 1.7,dod = '1998-05-07'
WHERE id= 3;
--  ------------------
DELETE FROM db_1702.student
WHERE gender is NULL ;  -- 删除gender为空的字段

DELETE FROM db_1702.student
WHERE age BETWEEN 20 AND 22; -- BETWEEN 在什么之间。 闭区间，包含20和22

# collate = utf8_unicode_cs CI Case Insensitive  大小写不敏感

SHOW DATABASES ;  -- 显示数据库

SHOW TABLES ;   -- 显示表

SHOW TABLE STATUS FROM db_1702;  -- 显示1702数据库中所有表的信息

SHOW TABLE STATUS FROM db_1702
WHERE name = 'student';    -- 只看学生表的信息

SHOW VARIABLES LIKE 'char%';    -- ?
SHOW VARIABLES LIKE 'coll%';  -- ?

SHOW VARIABLES ;  -- 显示变量

SHOW CREATE TABLE db_1702.student;  -- 显示建表语句

SELECT * -- * 代表所有行，所有列
FROM db_1702.student;

SELECT count(*)         -- 函数count 计数，统计
    FROM db_1702.student;-- 查看表中有多少条记录  DISTINCT  去掉重复的

SHOW DATABASES ;

