
-- 仿 http://dict.cn/ 设计一个简单的在线电子词典数据库表结构，实现从英文查中文，从中文查英文功能

DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.english;
CREATE TABLE db_dict.english(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  word VARCHAR(255) NOT NULL COMMENT '单词'
)COMMENT '英文表';

DROP TABLE IF EXISTS db_dict.chinese;
CREATE TABLE db_dict.chinese(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  definition VARCHAR(255) NOT NULL COMMENT '词',
  part VARCHAR(255) COMMENT '词性',
  phonetic VARCHAR(255) COMMENT '音标',
  example VARCHAR(255) COMMENT '例句'
)COMMENT '中文表';


DROP TABLE IF EXISTS db_dict.english_chinese;
CREATE TABLE db_dict.english_chinese(
  englishId INT COMMENT '英文ID FK',
  chineseId INT COMMENT '中文ID FK',
  PRIMARY KEY (englishId,chineseId)
)COMMENT '英文中文关联表';

ALTER TABLE db_dict.english_chinese
    ADD CONSTRAINT
english_chinese_fk_englishId
FOREIGN KEY (englishId)
  REFERENCES db_dict.english(id);

ALTER TABLE db_dict.english_chinese
    ADD CONSTRAINT
english_chinese_fk_chineseId
FOREIGN KEY (chineseId)
  REFERENCES db_dict.chinese(id);

INSERT INTO db_dict.chinese(id,db_dict.chinese.definition) VALUE (NULL ,'苹果');
INSERT INTO db_dict.chinese(id,db_dict.chinese.definition) VALUE (NULL ,'黄金');
INSERT INTO db_dict.chinese(id,db_dict.chinese.definition) VALUE (NULL ,'飞机');
INSERT INTO db_dict.english VALUE (NULL ,'apple');
INSERT INTO db_dict.english VALUE (NULL ,'biffin');
INSERT INTO db_dict.english VALUE (NULL ,'gold');
INSERT INTO db_dict.english VALUE (NULL ,'plane');

INSERT INTO db_dict.english_chinese VALUE (1,1);
INSERT INTO db_dict.english_chinese VALUE (2,1);
INSERT INTO db_dict.english_chinese VALUE (3,2);
INSERT INTO db_dict.english_chinese VALUE (4,3);


SELECT e.id,e.word
FROM db_dict.english e INNER JOIN db_dict.chinese c INNER JOIN db_dict.english_chinese ec
ON e.id = ec.englishId AND c.id = ec.chineseId
WHERE definition = '黄金';

SELECT *
FROM db_dict.english_chinese ec INNER JOIN db_dict.english e INNER JOIN db_dict.chinese c
ON c.id = ec.chineseId AND e.id = ec.englishId
WHERE word = 'apple';

-- 在题 1 的基础上，实现查英文显示中文释义，及词性、音标、详细解释，例句的功能
INSERT INTO db_dict.english VALUE (NULL ,'earth');
INSERT INTO db_dict.english VALUE (NULL ,'world');
INSERT INTO db_dict.chinese VALUE (NULL ,'地球','n:地球；陆地','英 [ɜːθ];美 [ɜːrθ]','The moon goes round the earth.月亮绕着地球转。');
INSERT INTO db_dict.chinese VALUE (NULL ,'世界','n. 世界；地球；世人；世间；领域；adj. 世界的','英 [wɜːld] ;美 [wɜːrld]','He is the richest man in the world.他是世界上最富有的人。');

INSERT INTO db_dict.english_chinese VALUE (5,4);
INSERT INTO db_dict.english_chinese VALUE (6,5);

SELECT *
FROM db_dict.english_chinese ec INNER JOIN db_dict.english e INNER JOIN db_dict.chinese c
    ON c.id = ec.chineseId AND e.id = ec.englishId
WHERE word = 'earth';