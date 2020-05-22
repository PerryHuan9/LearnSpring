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
