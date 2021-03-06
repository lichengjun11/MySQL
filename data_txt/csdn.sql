DROP TABLE IF EXISTS db_1702.csdn;
CREATE TABLE db_1702.csdn(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  username VARCHAR(255) COMMENT '用户名',
  password VARCHAR(255) COMMENT '密码',
  email VARCHAR(255) COMMENT '邮箱'
)COMMENT 'CSDN 用户表';

SELECT *
FROM db_1702.csdn;

LOAD DATA LOCAL INFILE 'C:\\Users\\lichengjun\\Desktop\\www.csdn.net.sql'
    INTO TABLE db_1702.csdn
FIELDS TERMINATED BY ' # '(username,password,email)
SET id = NULL ;

SELECT count(*)
FROM db_1702.csdn;