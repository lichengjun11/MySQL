DROP TABLE IF EXISTS db_1702.city;
CREATE TABLE db_1702.city(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  geo VARCHAR(255) COMMENT '地址',
  longitude VARCHAR(255) COMMENT '经度',
  latitude VARCHAR(255) COMMENT '纬度',
  ip INT COMMENT 'ip 个数'
);

SELECT *
FROM db_1702.city;

LOAD DATA LOCAL INFILE 'C:\\Users\\lichengjun\\IdeaProjects\\MySQL\\data\\BaiduMap_cityCenter(1).txt'
    INTO TABLE db_1702.city
FIELDS TERMINATED BY ','(geo,longitude,latitude)
SET id = NULL ;