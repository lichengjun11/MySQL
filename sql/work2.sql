DROP DATABASE IF EXISTS db_work;
CREATE DATABASE db_work;

DROP TABLE IF EXISTS db_work.user;
CREATE TABLE db_work.user (
  id       INT                   AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name     VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  team     VARCHAR(255) NOT NULL
  COMMENT '组别',
  role     VARCHAR(255) NOT NULL DEFAULT '员工'
  COMMENT '角色：员工 或 组长'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_work.log;
CREATE TABLE db_work.log (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content TEXT NOT NULL
  COMMENT '内容',
  time    DATE NOT NULL
  COMMENT '时间',
  userId  INT COMMENT 'FK 用户 ID'
)
  COMMENT '日志表';

ALTER TABLE db_work.log
  ADD CONSTRAINT
  log_fk_userId
FOREIGN KEY (userId)
REFERENCES db_work.user (id);

INSERT INTO db_work.user (name, password, team) VALUE ('emp1', '123', '第一组');
INSERT INTO db_work.user (name, password, team) VALUE ('emp2', '123', '第一组');
INSERT INTO db_work.user (name, password, team) VALUE ('emp3', '123', '第二组');
INSERT INTO db_work.user (name, password, team) VALUE ('emp4', '123', '第一组');
INSERT INTO db_work.user (name, password, team, role) VALUE ('team_leader1', '123', '第一组', '组长');
INSERT INTO db_work.user (name, password, team, role) VALUE ('team_leader2', '123', '第二组', '组长');

INSERT INTO db_work.log VALUE (NULL, 'content1 1', '2017-5-31', 1);
INSERT INTO db_work.log VALUE (NULL, 'content1 2', '2017-6-1', 1);
INSERT INTO db_work.log VALUE (NULL, 'content2 1', '2017-5-31', 2);
INSERT INTO db_work.log VALUE (NULL, 'content2 2', '2017-6-1', 2);
INSERT INTO db_work.log VALUE (NULL, 'content3 1', '2017-5-31', 3);
INSERT INTO db_work.log VALUE (NULL, 'content4 1', '2017-5-31', 4);
INSERT INTO db_work.log VALUE (NULL, 'content5 1', '2017-5-31', 5);

-- 登录
SELECT *
FROM db_work.user
WHERE name = 'team_leader1' AND password = '123';

-- 员工查看自己的日志
SELECT u.name,l.content,l.time
FROM db_work.user u INNER JOIN db_work.log l
ON u.id = l.userId
WHERE name = 'emp1';

-- 组长查看本组所有日志
SELECT u.name,l.content,l.time
FROM db_work.user u INNER JOIN db_work.log l
    ON u.id = l.userId
WHERE team = '第一组';





