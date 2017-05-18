DROP TABLE IF EXISTS db_1702.test;
CREATE TABLE db_1702.test(
  id INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  col VARCHAR(255) COMMENT 'test column'
);

ALTER TABLE db_1702.new_test
    RENAME db_1702.test;  -- 修改表名

SHOW TABLES ;

ALTER TABLE db_1702.test
    ADD COLUMN col VARCHAR(255);  -- 添加一列

ALTER TABLE db_1702.test
  ADD COLUMN col2 VARCHAR(255) AFTER id;  -- 添加得这一行在id的后面

ALTER TABLE db_1702.test
  ADD COLUMN col3 VARCHAR(255) FIRST ; -- 添加的这一行在表的第一列

SHOW FULL COLUMNS FROM db_1702.test;

ALTER TABLE db_1702.test
    DROP COLUMN col2;

ALTER TABLE db_1702.test
    MODIFY COLUMN col int FIRST ;  -- 修改数据类型，并且让它变为第一行

ALTER TABLE db_1702.test
    MODIFY COLUMN id int ;    -- 修改主键约束
ALTER TABLE db_1702.test
    DROP PRIMARY KEY ;     -- 修改主键约束

ALTER TABLE db_1702.test
    ADD CONSTRAINT pk_test_id PRIMARY KEY (id); -- 添加id为主键约束

ALTER TABLE db_1702.test
    CHANGE col colnew VARCHAR(255)
  AFTER id;     -- 同时改了名字，数据类型，还有位置


ALTER TABLE db_1702.student_course
    DROP FOREIGN KEY fk_student_course_studentId;  -- 让外键失效
