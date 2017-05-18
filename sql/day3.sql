SHOW DATABASES ;
USE db_1702;
SHOW TABLES ;

SHOW FULL COLUMNS FROM db_1702.student;
SHOW FULL COLUMNS FROM db_1702.course;
SHOW FULL COLUMNS FROM db_1702.student_course;

SELECT *
FROM db_1702.student;

SELECT *
FROM db_1702.course;

SELECT *
FROM db_1702.student_course;

TRUNCATE TABLE db_1702.student_course;

-- 选课表 学生<->课程
DROP TABLE IF EXISTS db_1702.student_course;
CREATE TABLE db_1702.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
);

-- alter  改变  DDL
ALTER TABLE db_1702.student_course  -- 修改表的定义
    ADD CONSTRAINT    -- 添加约束
fk_student_course_studentId   #给约束起的名字
FOREIGN KEY (studentId)    -- 外键 studentId
  REFERENCES db_1702.student(id)  -- 引用学生表的主键id
  ON DELETE SET NULL ;-- ???？？？


ALTER TABLE db_1702.student_course
    ADD CONSTRAINT
fk_student_course_courseId
FOREIGN KEY (courseId)
  REFERENCES db_1702.course(id);

SHOW FULL COLUMNS FROM db_1702.student_course;  -- 查看表中所有数据

INSERT INTO db_1702.student_course
    VALUES (NULL ,1,1,NULL );

INSERT INTO db_1702.student_course
    VALUES (NULL ,1,2,NULL );

INSERT INTO db_1702.student_course
    VALUES (NULL ,3,2,NULL );

INSERT INTO db_1702.student_course
    VALUES (NULL ,2,2,NULL );

USE db_1702;

SELECT *
FROM db_1702.student_course;

SELECT *
FROM db_1702.student;

DELETE FROM db_1702.student;


 SET FOREIGN_KEY_CHECKS=1;
SHOW FULL COLUMNS FROM db_1702.student_course;