# 数据库操作命令
# 显示所有databases
SHOW DATABASES;
# 创建database
CREATE DATABASE test;
# 删除database
DROP DATABASE test;
# 切换到指定数据库
USE test;

# 创建表
CREATE TABLE classes
(
    id   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) COMMENT ='班级信息' ENGINE = InnoDB
                  DEFAULT CHARSET = utf8;

-- 创建students表：
CREATE TABLE students
(
    id       BIGINT       NOT NULL AUTO_INCREMENT,
    class_id BIGINT       NOT NULL,
    name     VARCHAR(100) NOT NULL,
    gender   VARCHAR(1)   NOT NULL,
    score    INT          NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# 数据表操作命令
# 查看database中所有表
SHOW TABLES;
# 查看表结构
DESC classes;
# 查看创建表的SQL语句
SHOW CREATE TABLE students;
# 删除表
DROP TABLE students;


-- 如果learnSql数据库不存在，创建learnSql数据库
CREATE DATABASE IF NOT EXISTS learnSql;

-- 切换到learnSql数据库
USE learnSql;

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS students;

# 修改表注释
ALTER table students
    COMMENT '学生信息';

# 查询对应表的注释
SELECT table_name, table_comment
from information_schema.TABLES
where table_name = 'students';


# 修改字段注释
ALTER TABLE students
    MODIFY column id int COMMENT '主键';

#  查询对应表字段信息
SELECT column_name, column_comment, column_type, column_key
from information_schema.columns
where table_name = 'students';








