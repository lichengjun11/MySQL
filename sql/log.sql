DROP DATABASE IF EXISTS db_work;
CREATE DATABASE db_work;

DROP TABLE IF EXISTS db_work.team; -- team  组
CREATE TABLE db_work.team (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title VARCHAR(255) NOT NULL
  COMMENT '组名称'
)
  COMMENT '组别表';

DROP TABLE IF EXISTS db_work.emp;
CREATE TABLE db_work.emp (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'pk',
  name     VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  type     CHAR(2)      NOT NULL
  COMMENT '0:组员；1：组长',
  teamId   INT COMMENT 'fk'
)
  COMMENT '员工表';


DROP TABLE IF EXISTS db_work.log;
CREATE TABLE db_work.log (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  content TEXT NOT NULL
  COMMENT '日志内容',
  time    DATE NOT NULL
  COMMENT '时间',
  empId   INT COMMENT 'FK'
)
  COMMENT '日志表';


ALTER TABLE db_work.emp
  ADD CONSTRAINT
  emp_fk_teamId
FOREIGN KEY (teamId)
REFERENCES db_work.team (id);

ALTER TABLE db_work.log
  ADD CONSTRAINT
  log_fk_empId
FOREIGN KEY (empId)
REFERENCES db_work.emp (id);

INSERT INTO db_work.team VALUE (NULL, '第一组');
INSERT INTO db_work.team VALUE (NULL, '第二组');
INSERT INTO db_work.team VALUE (NULL, '第三组');

INSERT INTO db_work.emp VALUE (NULL, '张浩', '123', '组员', 1);
INSERT INTO db_work.emp VALUE (NULL, '张洁', '123', '组员', 2);
INSERT INTO db_work.emp VALUE (NULL, '崔霞', '123', '组长', 1);
INSERT INTO db_work.emp VALUE (NULL, '胡婷', '123', '组员', 1);
INSERT INTO db_work.emp VALUE (NULL, '吴然', '123', '组员', 2);
INSERT INTO db_work.emp VALUE (NULL, '薛前', '123', '组员', 1);
INSERT INTO db_work.emp VALUE (NULL, '李丽', '123', '组长', 2);
INSERT INTO db_work.emp VALUE (NULL, '吴莹', '123', '组员', 3);
INSERT INTO db_work.emp VALUE (NULL, '张冰', '123', '组长', 3);

-- 登录
SELECT *
FROM db_work.emp
WHERE name = '张浩' AND password = '123';

INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-26', 1);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-27', 2);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-04-26', 3);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-20', 4);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-18', 1);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-26', 5);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-26', 1);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-26', 2);
INSERT INTO db_work.log VALUE (NULL, '日志内容', '2017-05-27', 3);
INSERT INTO db_work.log VALUE (NULL, '我叫李丽', '2017-05-27', 7);

-- 组员查询日志
SELECT *
FROM db_work.log
WHERE empId = 1;

-- 组长查询日志
SELECT
  e.name,
  l.content,
  l.time
FROM db_work.emp e LEFT JOIN db_work.log l
    ON e.id = l.empId
WHERE e.teamId = 1;

-- 组长按条件查询日志
SELECT
  e.name,
  l.content,
  l.time
FROM db_work.emp e INNER JOIN db_work.log l
    ON e.id = l.empId
WHERE e.teamId = 1 AND (e.name = '胡婷' AND l.time = '2017-05-20');


SELECT e.name,l.content,l.time
FROM db_work.emp e INNER JOIN db_work.log l
ON e.id = l.empId
WHERE name = '李丽' AND e.teamId = 2;









