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
    id   BIGINT       NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB
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

