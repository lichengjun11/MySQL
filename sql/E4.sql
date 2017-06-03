
DROP DATABASE IF EXISTS db_friend;
CREATE DATABASE db_friend;

DROP TABLE IF EXISTS db_friend.user;
CREATE TABLE db_friend.user(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) NOT NULL COMMENT '姓名',
  dab DATE COMMENT '生日',
  tel VARCHAR(255) COMMENT '手机号',
  address VARCHAR(255) COMMENT '住址',
  wechat VARCHAR(255) COMMENT '微信',
  qq VARCHAR(255) COMMENT 'qq',
  address2 VARCHAR(255) COMMENT '工作或学习地点',
  hobby VARCHAR(255) COMMENT '爱好',
  near INT COMMENT '亲密程度  0-10'
);
-- relation  联系
DROP TABLE IF EXISTS db_friend.relation;
CREATE TABLE db_friend.relation(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT ' ID PK',
  knowtime INT COMMENT '认识时间   年',
  knowmode VARCHAR(255) COMMENT '认识方式',
  near INT COMMENT '亲密程度  0-10',
  communicatetime VARCHAR(255) COMMENT '沟通时间',
  communicatemode VARCHAR(255) COMMENT '沟通方式',
  communicatecontent VARCHAR(255) COMMENT '沟通内容',
  userId INT COMMENT 'FK PK'
);

ALTER TABLE db_friend.relation
    ADD CONSTRAINT
relation_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_friend.user(id);

INSERT INTO db_friend.user VALUE (NULL ,'董继山','1997-02-03','13897435691','山东济宁','13897435691','12309834','北京','打球',4);
INSERT INTO db_friend.user VALUE (NULL ,'胡安瑞','1998-05-04','13535665446','山东济宁','13535665446','102398002','上海','唱歌',5);
INSERT INTO db_friend.user VALUE (NULL ,'韩福生','1996-06-03','18235644778','山东济宁','18235644778','125635789','深圳','跳舞',6);

INSERT INTO db_friend.relation VALUE (NULL ,5,'同学',9,'上周','手机','学习怎么样',3);
INSERT INTO db_friend.relation VALUE (NULL ,4,'同学',8,'上周','微信','工作怎么样',2);
INSERT INTO db_friend.relation VALUE (NULL ,3,'同学',7,'上周','手机','瘦了没有',1);
INSERT INTO db_friend.relation VALUE (NULL ,5,'同学',9,'昨天','qq','胖了没有',3);
INSERT INTO db_friend.relation VALUE (NULL ,4,'同学',8,'昨天','手机','发工资了没',2);

-- 查询所有朋友及每次沟通记录
SELECT name,r.*
FROM db_friend.user u INNER JOIN db_friend.relation r
ON u.id = r.userId;

# 列出一个朋友的工作或学习的变迁
SELECT address,address2
FROM db_friend.user
WHERE name = '韩福生';

# 计算每个朋友的平均亲密程度，降序排序
SELECT avg(r.near)
FROM db_friend.user u INNER JOIN db_friend.relation r
ON u.id = r.userId
GROUP BY r.near ;