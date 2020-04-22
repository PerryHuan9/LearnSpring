# 数据库操作命令
# 显示所有databases
SHOW DATABASES;
# 创建database
CREATE DATABASE test;
# 删除database
DROP DATABASE test;
# 切换到指定数据库
USE test;


# 数据表操作命令
# 查看database中所有表
SHOW TABLES;
# 查看表结构
DESC classes;
# 查看创建表的SQL语句
SHOW CREATE TABLE students;
# 删除表
DROP TABLE students;
# 修改表
# 增加一列
ALTER TABLE students
    ADD COLUMN age INT NOT NULL;
# 删除列
ALTER TABLE students
    DROP COLUMN age;


-- 如果learnSql数据库不存在，创建learnSql数据库
CREATE DATABASE IF NOT EXISTS learnSql;

-- 切换到learnSql数据库
USE learnSql;

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS students;


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


# 基本查询
SELECT *
FROM students;

# 条件查询
SELECT *
FROM students
WHERE (score >= 90 OR score < 60)
  AND gender = 'M';

# 阴影查询
SELECT id, name
FROM students;

# 排序, 默认为ASC 升序
SELECT *
FROM students
ORDER BY score;

# 降序排序 DESC
SELECT id, name, score
FROM students
ORDER BY score DESC;

# 条件查询且排序
SELECT *
FROM students
WHERE gender = 'F'
order by score;

# 多个排序字段
# 下面在score值相同时使用name升序排序
SELECT *
FROM students
ORDER BY score DESC, name ASC;


# 使用LIMIT <M> OFFSET <N>可以对结果集进行分页，每次查询返回结果集的一部分；
SELECT *
FROM students
ORDER BY score DESC
LIMIT 3 OFFSET 0;
# OFFSET 表示从第四个开始查，即第四个
SELECT *
FROM students
ORDER BY score DESC
LIMIT 3 OFFSET 3;

# 聚合查询
# count 计数 count(*)与count(id)效果一致
SELECT COUNT(*)
FROM students;
# 为聚合输出列取个别名
SELECT COUNT(*) num
FROM students
where gender = 'M';

# sum聚合 求和（仅能对数值类型操作）
SELECT SUM(score) sun_score
FROM students;

# avg聚合 求平均值（仅能对数值类型操作）
SELECT AVG(score)
FROM students
WHERE gender = 'F';

# max 求最大值
# min求最小值
SELECT MAX(students.score)
FROM students;
SELECT MIN(students.score)
FROM students;

# 聚合查询, 分别统计相同class_id数据的数量
SELECT class_id, COUNT(*) count
FROM students
GROUP BY class_id;

# 多表查询又叫笛卡尔查询
# 查询的结果集列数是所有表的列数之和，行数则是所有表的行数之积
SELECT *
FROM students,
     classes;

# 当出现重名属性，
SELECT students.id  sid,
       students.name,
       students.gender,
       students.score,
       classes.id   cid,
       classes.name cname
FROM classes,
     students;


# 连接查询
# 内连接 结果会把两张表中的数据交集取出，依据是条件部分
# 注意INNER JOIN查询的写法是：
# 1、先确定主表，仍然使用FROM <表1>的语法；
# 2、再确定需要连接的表，使用INNER JOIN <表2>的语法；
# 3、然后确定连接条件，使用ON <条件...>，这里的条件是s.class_id = c.id，表示students表的class_id列与classes表的id列相同的行需要连接；
# 4、可选：加上WHERE子句、ORDER BY等子句。
SELECT s.id, s.name, s.gender, c.name class, s.score
FROM students s
         INNER JOIN classes c on s.class_id = c.id;

# 外连接
# 左外连接
SELECT s.id, s.name, s.gender, c.name class, s.score
FROM students s
         LEFT OUTER JOIN classes c on s.class_id = c.id;
# 由外连接
SELECT s.id, s.name, s.gender, c.name class, s.score
FROM students s
         RIGHT OUTER JOIN classes c on c.id = s.class_id;

# 全外连接 MYSQL不支持
# SELECT s.id, s.name, s.class_id, c.name class_name, s.gender, s.score
# FROM students s FULL OUTER JOIN classes c
# ON s.class_id = c.id;


# 修改数据
# 插入数据
INSERT INTO students(name, class_id, gender, score)
VALUES ('1212', 3, 'M', 66),
       ('天一', 3, 'M', 68),
       ('1666', 3, 'M', 66);


# 更新数据
UPDATE students
SET name    = '天下',
    class_id=3
WHERE id = 11;

UPDATE students
SET score=score + 10
WHERE score < 60;


# 删除数据
DELETE
FROM students
WHERE id = 12;


# 插入或替换: 如果不存在就插入，存在就替换
REPLACE INTO students (id, name, score, gender, class_id)
VALUES (11, 'Perry', 88, 'M', 5);

# 插入或更新
INSERT INTO students(id, name, class_id, gender, score)
VALUES (12, 'huang', 3, 'F', 99)
ON DUPLICATE KEY UPDATE name='huang999',
                        class_id='3',
                        gender='F',
                        score=99;

# 插入或忽略
INSERT IGNORE INTO students(id, name, score, gender, class_id)
VALUES (11, 'Perry', 88, 'M', 5);


# 快照  对一个表进行快照，即复制一份当前表的数据到一个新表
CREATE TABLE students_2
SELECT *
FROM students;


CREATE TABLE statistics
(
    id       BIGINT AUTO_INCREMENT,
    class_id INT    NOT NULL,
    average  DOUBLE NOT NULL,
    PRIMARY KEY (id)
);

# 写入查询结果集： 将查询的结果集写入另外一个表
INSERT INTO statistics(class_id, average)
SELECT class_id, AVG(score)
FROM students
GROUP BY class_id;


# 声明外键
ALTER TABLE students
    ADD CONSTRAINT fk_class_id
        FOREIGN KEY (class_id)
            REFERENCES classes (id);

# 删除外键
ALTER TABLE students
    DROP FOREIGN KEY fk_class_id;

# 声明索引
ALTER TABLE students
    ADD INDEX idx_score (score);

# 唯一索引
ALTER TABLE classes
    ADD UNIQUE INDEX idx_name (name);

# 仅增加唯一限制，不增加索引
ALTER TABLE classes
    ADD CONSTRAINT idx_name UNIQUE (name);


# 在查询的时候，数据库系统会自动分析查询语句，并选择一个最合适的索引。
# 但是很多时候，数据库系统的查询优化器并不一定总是能使用最优索引。
# 如果我们知道如何选择索引，可以使用FORCE INDEX强制查询使用指定的索引。
SELECT *
FROM students FORCE INDEX (idx_class_id)
WHERE class_id = 1
ORDER BY score DESC;

















