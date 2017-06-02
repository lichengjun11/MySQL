# 核心功能
/*
1. 用户
2. 文集
3. 文章
4. 评论
5. 关注
6. 专题
7. 收藏
8. 打赏
*/

DROP DATABASE IF EXISTS db_jianshu;
CREATE DATABASE db_jianshu;

-- 1.用户 user
DROP TABLE IF EXISTS db_jianshu.user;
CREATE TABLE db_jianshu.user(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  nick VARCHAR(255) UNICODE NOT NULL COMMENT '昵称',
  password VARCHAR(255) NOT NULL COMMENT '密码',
  mobile VARCHAR(255) UNICODE  COMMENT '手机号',
  avatar VARCHAR(255) NOT NULL COMMENT '头像',
  pay INT COMMENT '打赏金额，默认-2元；null - 关闭打赏',
  money DECIMAL(8,2) NOT NULL COMMENT '账户余额'
) COMMENT '用户表';

-- 2.文集 notebook
DROP TABLE IF EXISTS db_jianshu.notebook;      -- notebook 文集
CREATE TABLE db_jianshu.notebook(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '名称',
  userId INT COMMENT '用户 id '
) COMMENT '文集表';

# 3.note  文章
DROP TABLE IF EXISTS db_jianshu.note;
CREATE TABLE db_jianshu.note(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) NOT NULL COMMENT '标题',
  content MEDIUMTEXT COMMENT '内容',
  time DATETIME DEFAULT now() COMMENT '时间',
  views INT DEFAULT 0 COMMENT '阅读次数',
  notebookId INT COMMENT '文集ID'
)COMMENT '文章表';

#like table : id userId noteId

# 4.评论 comment
DROP TABLE IF EXISTS db_jianshu.comment;
CREATE TABLE db_jianshu.comment(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  content TEXT COMMENT '评论内容',
  time DATETIME DEFAULT now() COMMENT '时间',
  noteId INT COMMENT 'fk 文章id',
  userId INT COMMENT 'fk 用户 id',
  commentId INT COMMENT 'fk 评论 id'
)COMMENT '评论表';

# zan table : id userId commentId time

-- 5.专题 collection
DROP TABLE IF EXISTS db_jianshu.collection;
CREATE TABLE db_jianshu.collection(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) COMMENT '专题名称',
  userId INT COMMENT '用户id fk'
)COMMENT '专题表';

-- 6.专题-文章  collection_note  多对多关系
DROP TABLE IF EXISTS db_jianshu.collection_note;
CREATE TABLE db_jianshu.collection_note(

)


-- 关注
DROP TABLE IF EXISTS db_jianshu.follow;
CREATE TABLE db_jianshu.follow(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  count INT COMMENT '关注次数',
  userId INT COMMENT '用户ID '
);


ALTER TABLE db_jianshu.notebook
    ADD CONSTRAINT
notebook_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.note
    ADD CONSTRAINT
note_fk_notebookId
FOREIGN KEY (notebookId)
  REFERENCES db_jianshu.notebook(id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note(id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_commentId
FOREIGN KEY (commentId)
REFERENCES db_jianshu.comment(id);