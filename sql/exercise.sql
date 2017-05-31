DROP TABLE db_test.student1;
CREATE TABLE db_test.student1 (
  id   INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name VARCHAR(255) COMMENT '姓名',
  age  DATETIME,
  sex  VARCHAR(255) COMMENT '性别'
);
INSERT INTO db_test.student1 VALUE (NULL, '赵雷', '1987-02-04', '男');
INSERT INTO db_test.student1 VALUE (NULL, '王五', '1990-02-04', '男');
INSERT INTO db_test.student1 VALUE (NULL, '小红', '1987-04-04', '女');
INSERT INTO db_test.student1 VALUE (NULL, '吴娟', '1998-02-04', '女');
INSERT INTO db_test.student1 VALUE (NULL, '周梅', '1996-03-05', '女');
INSERT INTO db_test.student1 VALUE (NULL, '成功', '1995-02-25', '男');

DROP TABLE db_test.course1;
CREATE TABLE db_test.course1 (
  Cid  INT,
  name VARCHAR(255) COMMENT '课程名',
  Tid  INT
);

INSERT INTO db_test.course1 VALUE (1, '语文', 1);
INSERT INTO db_test.course1 VALUE (2, '数学', 1);
INSERT INTO db_test.course1 VALUE (3, '英语', 2);
INSERT INTO db_test.course1 VALUE (4, '地理', 3);

DROP TABLE db_test.Teacher;
CREATE TABLE db_test.Teacher (
  Tid  INT,
  name VARCHAR(255)
);

INSERT INTO db_test.Teacher VALUE (1, '张静');
INSERT INTO db_test.Teacher VALUE (2, '李霞');
INSERT INTO db_test.Teacher VALUE (3, '布伟');
INSERT INTO db_test.Teacher VALUE (4, '孙浩');

DROP TABLE db_test.SC;
CREATE TABLE db_test.SC (
  Sid   VARCHAR(10),
  Cid   VARCHAR(10),
  score DECIMAL(18, 1)
);

INSERT INTO db_test.SC VALUES (1, 1, 98);
INSERT INTO db_test.SC VALUES (1, 2, 90);
INSERT INTO db_test.SC VALUES (1, 3, 99);
INSERT INTO db_test.SC VALUES (2, 1, 70);
INSERT INTO db_test.SC VALUES (2, 2, 60);
INSERT INTO db_test.SC VALUES (2, 3, 80);

-- 1.查询"01"课程比"02"课程成绩高的学生的信息及课程分数

SELECT
  a.*,
  b.score,
  c.score
FROM db_test.student1 a, db_test.SC b, db_test.sc c
WHERE a.id = b.sid AND a.id = c.sid
      AND b.cid = '01' AND c.cid = '02'
      AND b.score > c.score;
-- ----------
SELECT
  a.*,
  b.score,
  c.score
FROM db_test.student1 a INNER JOIN db_test.SC b
  INNER JOIN db_test.SC c
    ON a.id = b.Sid AND a.id = c.Sid
WHERE b.Cid = 1 AND c.Cid = 2
      AND b.score > c.score;

-- 2.查询平均成绩大于等于60分的同学的学生编号、学生姓名和平均成绩
SELECT
  a.id,
  a.name,
  avg(sc.score) avg_score
FROM db_test.student1 a, db_test.sc
WHERE a.id = sc.sid
GROUP BY a.id, a.name
HAVING avg_score >= 60
ORDER BY a.id;

SELECT
  s.id,
  s.name,
  avg(db_test.sc.score)
FROM db_test.student1 s LEFT JOIN db_test.SC S1
    ON s.id = S1.Sid
GROUP BY s.id, s.name
HAVING avg(db_test.sc.score) > 60
ORDER BY s.id;
-- 5.查询"李"姓老师的数量
SELECT count(*)
FROM db_test.Teacher
WHERE name LIKE '李%';

-- 4.查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩
select a.id, a.name, count(b.cid), sum(b.score)
from db_test.student1 a inner join db_test.sc b
    on a.id = b.sid
group by a.id, a.name
order by a.id;
