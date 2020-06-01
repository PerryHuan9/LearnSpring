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


# 修改表
# 增加一列
ALTER TABLE students
    ADD COLUMN age INT NOT NULL;

# 在指定位置增加一列
ALTER TABLE students
    ADD hobby VARCHAR(500) COMMENT '注释' AFTER score;

# 删除列
ALTER TABLE students
    DROP COLUMN age;

# 能修改字段类型、类型长度、默认值、注释
# 对某字段进行修改
ALTER TABLE table_name
    MODIFY [COLUMN] 字段名 新数据类型 新类型长度 新默认值 新注释;
-- COLUMN关键字可以省略不写

# mysql修改字段名：
ALTER TABLE table_name
    CHANGE [column] 旧字段名 新字段名 新数据类型;

# 修改表名
ALTER TABLE 旧表名 RENAME TO 新表名;

# 修改表注释
ALTER TABLE 表名
    COMMENT '新注释';


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

















