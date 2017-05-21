DROP DATABASE IF EXISTS db_exam;
CREATE DATABASE db_exam;
SHOW DATABASES ;

DROP TABLE IF EXISTS db_exam.stuent;
CREATE TABLE db_exam.student(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) COMMENT '姓名',
  age INT COMMENT '年龄',
  gender VARCHAR(255) COMMENT '性别',
  dob DATE COMMENT '出生日期',
  departmentId INT COMMENT '系别表id'
)COMMENT '学生表';

DROP TABLE IF EXISTS db_exam.department;
CREATE TABLE db_exam.department(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '系名称',
  tel VARCHAR(255) COMMENT '电话号码'
)COMMENT '系别表';

DROP TABLE IF EXISTS db_exam.course;
CREATE TABLE db_exam.course(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '课程名称',
  credit INT COMMENT '学分'
)COMMENT '课程表';

DROP TABLE IF EXISTS db_exam.student_course;
CREATE TABLE db_exam.student_course(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId INT COMMENT '课程 ID',
  grade INT COMMENT '考试成绩'
)COMMENT '选课表';

ALTER TABLE db_exam.student
  ADD CONSTRAINT
  fk_student_department
FOREIGN KEY (departmentId)
REFERENCES db_exam.department(id); -- 系别表的外键

ALTER TABLE db_exam.student_course
  ADD CONSTRAINT
  fk_student_course_studentId
FOREIGN KEY (studentId)
REFERENCES db_exam.student(id); -- 学生表的外键

ALTER TABLE db_exam.student_course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_exam.course(id); -- 课程表的外键

INSERT INTO db_exam.student VALUES (NULL ,'刘翔',17,'男','2000-09-08',1);
INSERT INTO db_exam.student VALUES (NULL ,'王五',18,'男','1999-09-08',2);
INSERT INTO db_exam.student VALUES (NULL ,'赵四',19,'男','1998-09-08',3);
INSERT INTO db_exam.student VALUES (NULL ,'孙悟空',20,'男','1997-09-08',1);
INSERT INTO db_exam.student VALUES (NULL ,'张三',21,'男','1996-09-08',4);

INSERT INTO db_exam.department VALUES (NULL ,'中文系','13545655678');
INSERT INTO db_exam.department VALUES (NULL ,'音乐系','15665634767');
INSERT INTO db_exam.department VALUES (NULL ,'美术系','13545689997');
INSERT INTO db_exam.department VALUES (NULL ,'外语系','13545689997');
INSERT INTO db_exam.department VALUES (NULL ,'机械工程系','13545689997');

INSERT INTO db_exam.course VALUES (NULL ,'java',5);
INSERT INTO db_exam.course VALUES (NULL ,'css',8);
INSERT INTO db_exam.course VALUES (NULL ,'mysql',6);
INSERT INTO db_exam.course VALUES (NULL ,'html',7);
INSERT INTO db_exam.course VALUES (NULL ,'html5',9);

INSERT INTO db_exam.student_course VALUES (NULL ,2,4,90);
INSERT INTO db_exam.student_course VALUES (NULL ,1,4,89);
INSERT INTO db_exam.student_course VALUES (NULL ,2,3,80);
INSERT INTO db_exam.student_course VALUES (NULL ,2,5,98);
INSERT INTO db_exam.student_course VALUES (NULL ,4,5,96);

ALTER TABLE db_exam.student_course CHANGE grade score CHAR(10);
SELECT *
FROM db_exam.student
WHERE name LIKE '王%';

TRUNCATE TABLE db_exam.student;
TRUNCATE TABLE db_exam.department;
TRUNCATE TABLE db_exam.course;
TRUNCATE TABLE db_exam.student_course;


SHOW CREATE TABLE db_exam.student;
SHOW CREATE TABLE db_exam.student_course;
SHOW CREATE TABLE db_exam.course;
SHOW CREATE TABLE db_exam.department;

