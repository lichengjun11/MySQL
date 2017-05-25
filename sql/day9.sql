

CREATE USER abc@'localhost' IDENTIFIED BY '123456';   -- 创建用户

SELECT *
FROM mysql.user;   -- 查询用户

RENAME USER abc@'localhost' to gogogo;   -- 更改用户名
RENAME USER tengfei@'%' TO tengfei@'localhost';

SET PASSWORD FOR gogogo =  PASSWORD ('qwe');   -- 修改用户密码

SELECT *
FROM mysql.gogogo;

SHOW GRANTS FOR gogogo@'localhost';  -- 查询授权

CREATE USER www@'localhost' IDENTIFIED BY '123';

RENAME USER fff@'localhost' TO aaa@'localhost';

SET PASSWORD FOR fff = PASSWORD ('12');   -- 修改用户密码

DROP USER fff@'%';    -- 删除用户


GRANT CREATE ON scott.* TO 'tengfei'@'localhost';   -- 赋予tengfei这个用户创建scott数据库的权限
GRANT ALL ON scott.* TO 'tengfei'@'localhost';  -- 赋予所有权限
REVOKE ALL ON scott.* FROM tengfei@'localhost';   -- 撤销所有权限

DROP USER tengfei@'localhost';