SHOW DATABASES;

DROP DATABASE IF EXISTS db_1702; -- 如果存在db_1702 就删除   DROR：删除  DATABASE:  数据库
CREATE DATABASE db_1702;   -- 创建数据库 db_1702

DROP TABLE IF EXISTS db_1702.student; -- 如果存在db_1702.student表 就删除
CREATE TABLE db_1702.student(     -- 创建db_1702.student 的表
  id INT AUTO_INCREMENT PRIMARY KEY -- AUTO_INCREMENT: 自动增量   PRIMARY KEY :主键
  COMMENT 'ID',
  name  VARCHAR(255)   COMMENT '姓名',
  intro  TEXT COMMENT '简介',
  gender  CHAR(10) COMMENT '性别',
  age   INT UNSIGNED COMMENT '年龄',
  height  DOUBLE  (5,2)  COMMENT '身高',
  price  DECIMAL(6,2)  COMMENT '价格',
  dob  DATE COMMENT '出生日期',
  time  DATETIME  COMMENT '时间'
) COMMENT '学生表'; -- 给表添加注释

INSERT INTO db_1702.student VALUE
  (NULL,'Tom','I\'m 文武双全' ,'M', '18', 1.8, 8123.24, '1999-5-1', '2017-5-1 1:32:22');

INSERT INTO db_1702.student VALUES
  (NULL ,'张三','能言善辩','男',26,1.75,8656.66,'1993-5-9','2013-5-9 3:3:3');
SELECT *
FROM db_1702.student;

DELETE FROM db_1702.student;

TRUNCATE TABLE db_1702.course;

SHOW FULL COLUMNS FROM db_1702.student;

-- 课程表  课程名  学分 ...
DROP TABLE IF EXISTS db_1702.course;
CREATE TABLE db_1702.course(
  id  INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '课程名',
  credit INT COMMENT '学分'
);

DROP TABLE IF EXISTS db_1702.student_course;
CREATE TABLE db_1702.student_course(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId INT COMMENT '课程 ID',
  score INT COMMENT '考试成绩'
);

SELECT *
FROM db_1702.student ;

INSERT INTO db_1702.course VALUES (NULL,'mysql',5);
INSERT INTO db_1702.course VALUES (NULL,'java',4);

SELECT *
FROM db_1702.course;


INSERT INTO db_1702.student_course VALUES (NULL ,2,1,NULL );
INSERT INTO db_1702.student_course VALUES (NULL ,3,2,NULL );
INSERT INTO db_1702.student_course VALUES (NULL ,1,2,NULL );

SELECT *
FROM db_1702.student_course;


SHOW DATABASES ;