DROP TABLE IF EXISTS db_1702.iptest;
CREATE TABLE db_1702.iptest (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  start VARCHAR(255) COMMENT '起始 ip',
  stop  VARCHAR(255) COMMENT '终止 ip',
  loc VARCHAR(255) COMMENT 'IP 地址'
) COMMENT 'ip';

SELECT *
FROM db_1702.iptest;

LOAD DATA LOCAL INFILE '..\data\\iptest.txt'
    INTO TABLE db_1702.iptest
FIELDS TERMINATED BY '@@#'(start,stop,loc)
SET id = NULL ;