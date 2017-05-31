
DROP DATABASE IF EXISTS db_test;
CREATE DATABASE db_test;


DROP TABLE IF EXISTS db_test.user;
CREATE TABLE db_test.user(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  email VARCHAR(255) COMMENT '邮箱',
  usename VARCHAR(255) COMMENT '用户名',
  password VARCHAR(255) COMMENT '密码'

);

DROP TABLE IF EXISTS db_test.dl;
CREATE TABLE db_test.dl(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  email VARCHAR(255) COMMENT '邮箱',
  password VARCHAR(255) COMMENT '密码'
);

-- 注册
INSERT INTO db_test.user
    VALUE (NULL ,'1032432292@qq.com','wangfei','123456');

-- 登录判断
SELECT *
FROM db_test.user
WHERE email = '' AND password = '';

DROP TABLE IF EXISTS db_test.ly;
CREATE TABLE db_test.ly(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  time DATETIME,
  liuyan VARCHAR(255)
)COMMENT '留言表';

ALTER TABLE db_test.ly
    ADD CONSTRAINT
ly_fk_user
FOREIGN KEY (id)
  REFERENCES db_test.user(id);

UPDATE db_test.ly
    SET liuyan = 'xxxxxxxx',datatime=now()
WHERE id = '';

ALTER TABLE db_test.user
  ADD COLUMN guanliyuan VARCHAR(255) DEFAULT'null'
  AFTER id;
update  db_test.user
set guanliyuan=user.usename+'管理员'
WHERE id='' AND email=''AND password='' ;

SELECT *
FROM db_test.user z INNER JOIN db_test.ly l
    ON z.id = l.id;