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


# 在查询的时候，数据库系统会自动分析查询语句，并选择一个最合适的索引。
# 但是很多时候，数据库系统的查询优化器并不一定总是能使用最优索引。
# 如果我们知道如何选择索引，可以使用FORCE INDEX强制查询使用指定的索引。
# 声明索引
ALTER TABLE students
    ADD INDEX idx_class_id (class_id);

SELECT *
FROM students FORCE INDEX (idx_class_id)
WHERE class_id = 1
ORDER BY score DESC;



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
