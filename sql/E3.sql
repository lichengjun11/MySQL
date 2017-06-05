DROP DATABASE IF EXISTS db_testone;
CREATE DATABASE db_testone;

DROP TABLE IF EXISTS db_testone.student;
CREATE TABLE db_testone.student (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name       VARCHAR(255) NOT NULL
  COMMENT '姓名',
  dob        DATE         NOT NULL
  COMMENT '出生日期',
  department VARCHAR(255) COMMENT '系名称',
  address    VARCHAR(255) COMMENT '地址'
)
  COMMENT '学生表';

DROP TABLE IF EXISTS db_testone.score;
CREATE TABLE db_testone.score (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  course    VARCHAR(255) COMMENT '课程名',
  grade     INT COMMENT '成绩',
  studentId INT COMMENT '学生 ID FK'
)
  COMMENT '课程表';

ALTER TABLE db_testone.score
  ADD CONSTRAINT
  score_fk_studentId
FOREIGN KEY (studentId)
REFERENCES db_testone.student (id);

INSERT INTO db_testone.student VALUE (NULL, '李四', '1999-09-08', '中文系', '北京');
INSERT INTO db_testone.student VALUE (NULL, '孙浩', '1993-04-08', '英文系', '上海');
INSERT INTO db_testone.student VALUE (NULL, '牛壮', '1990-09-28', '电子系', '哈尔滨');
INSERT INTO db_testone.student VALUE (NULL, '王五', '1987-08-18', '电子系', '江苏');
INSERT INTO db_testone.student VALUE (NULL, '张三', '1994-07-06', '计算机系', '湖南');

INSERT INTO db_testone.score VALUE (NULL, '计算机', 89, 2);
INSERT INTO db_testone.score VALUE (NULL, '数学', 90, 1);
INSERT INTO db_testone.score VALUE (NULL, '英语', 78, 3);
INSERT INTO db_testone.score VALUE (NULL, '英语', 67, 2);
INSERT INTO db_testone.score VALUE (NULL, '数学', 75, 5);

-- 查询student表的所有记录
SELECT *
FROM db_testone.student;

-- 查询student表的第2条到4条记录
SELECT *
FROM db_testone.student
WHERE id BETWEEN 2 AND 4; -- 方案1

SELECT *
FROM db_testone.student
LIMIT 1, 3; -- 方案2

-- 从student表查询所有学生的学号（id）、姓名（name）和院系（department）的信息
SELECT
  id,
  name,
  department
FROM db_testone.student;

-- 从student表中查询计算机系和电子系的学生的信息
SELECT *
FROM db_testone.student
WHERE department = '计算机系' OR department = '电子系';

-- 从student表中查询年龄18~22岁的学生信息

SELECT name
FROM db_testone.student
WHERE timestampdiff(YEAR, dob, current_date) BETWEEN 18 AND 22; -- ?

SELECT current_time; -- 当前时间
SELECT current_date; -- 当前日期

SELECT timestampdiff(YEAR, '1992-10-10', current_date);

-- 从student表中查询每个院系有多少人
SELECT
  department,
  count(student.id)
FROM db_testone.student
GROUP BY department;

# 从score表中查询每个科目的最高分
SELECT
  max(grade),
  course
FROM db_testone.score
GROUP BY course;

#查询李四的考试科目（c_name）和考试成绩（grade）
SELECT
  s.name,
  s2.course,
  s2.grade
FROM db_testone.student s INNER JOIN db_testone.score s2
    ON s.id = s2.studentId
WHERE name = '李四';

# 用连接的方式查询所有学生的信息和考试信息
SELECT
  s.*,
  s2.*
FROM db_testone.student s INNER JOIN db_testone.score s2
    ON s.id = s2.studentId;

# SELECT *
# FROM db_testone.student s1 LEFT JOIN db_testone.score s2
#     ON s1.id = s2.studentId
# UNION
# SELECT *
# FROM db_testone.student s1 RIGHT JOIN db_testone.score s2
#     ON s1.id = s2.studentId;

# 计算每个学生的总成绩
SELECT
  sum(grade),
  name
FROM db_testone.student s INNER JOIN db_testone.score s2
    ON s.id = s2.studentId
GROUP BY name;

# 计算每个考试科目的平均成绩
SELECT
  course,
  avg(grade)
FROM db_testone.score
GROUP BY course;

# 查询计算机成绩低于95的学生信息
SELECT *
FROM db_testone.score
WHERE course = '计算机' AND grade < 95;

# 查询同时参加计算机和英语考试的学生的信息   ??
SELECT *
FROM db_testone.student s INNER JOIN db_testone.score s2
  ON s.id = s2.studentId
WHERE course = '计算机' AND course = '英语';
-- 2
SELECT *
FROM db_testone.student s1 INNER JOIN db_testone.score s2
ON s1.id = s2.studentId
WHERE s2.course IN ('英语','计算机');

# 将计算机考试成绩按从高到低进行排序
SELECT *
FROM db_testone.score
WHERE course = '计算机'
GROUP BY grade DESC;

# 从student表和score表中查询出学生的学号，然后合并查询结果   ??
SELECT
  name,
  s2.studentId
FROM db_testone.student s LEFT JOIN db_testone.score s2
    ON s.id = s2.studentId;

SELECT
  studentId,
  name
FROM db_testone.student s1 LEFT JOIN db_testone.score s2
    ON s1.id = s2.studentId
UNION
SELECT
  studentId,
  name
FROM db_testone.student s1 RIGHT JOIN db_testone.score s2
    ON s1.id = s2.studentId;


# 查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
SELECT
  name,
  department,
  course,
  grade
FROM db_testone.student s LEFT JOIN db_testone.score s2
    ON s.id = s2.studentId
WHERE name RLIKE '张*' OR name RLIKE '王*';

# 查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
SELECT
  name,
  dob,
  department,
  course,
  grade
FROM db_testone.student s INNER JOIN db_testone.score s2
    ON s.id = s2.studentId
WHERE address LIKE '%湖南%';





