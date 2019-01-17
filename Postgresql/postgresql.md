# POSTGRESQL 学习资料
## [PostgreSQL 官方文档](https://www.postgresql.org/docs/)
## [阿里大学-PostgreSQL数据库从入门到精通](https://edu.aliyun.com/course/52)

## 数据库版本
PostgreSQL 9.6.9 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-16), 64-bit
#### postgresql 命令
   ```
    ## 创建数据库
    $ createdb mydb
    ## 删除数据库
    $ dropdb mydb
    ## 数据库激活
    $ psql mydb
    ## 基本查询
    mydb=> SELECT version();
    mydb=> SELECT current_date;
    mydb=> SELECT 2 + 2;
    mydb=> \h    获取帮助
    mydb=> \q    退出
    mydb=> \i basics.sql  导入sql
    ## 创建表
    CREATE TABLE weather (
    city            varchar(80),
    temp_lo         int,           -- low temperature
    temp_hi         int,           -- high temperature
    prcp            real,          -- precipitation
    date            date
    );
    CREATE TABLE cities (
        name            varchar(80),
        location        point
    );

    PostgreSQL支持标准的SQL类型： int, smallint, real, double precision, char(N), varchar(N), date, time, timestamp,和 interval，还支持其它的通用类型和丰富的几何类型。PostgreSQL 允许你自定义任意数量的数据类型。因而类型名并不是语法关键字，除了SQL 标准要求支持的特例外。

    DROP TABLE tablename;

    ## 添加数据
    INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
    INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');

    ## copy 文件批量插入
    这里源文件的文件名必须在运行后端进程的那台机器上有效，而不是在客户端上，因为后端进程直接读取这个文件。 你可以在COPY中读到更多有关COPY命令的信息。
    COPY weather FROM '/home/user/weather.txt';

    ## 查询
        SELECT * FROM weather;
        SELECT city, (temp_hi+temp_lo)/2 AS temp_avg, date FROM weather;
        SELECT * FROM weather WHERE city = 'San Francisco' AND prcp > 0.0;
        SELECT * FROM weather   ORDER BY city;
        SELECT * FROM weather   ORDER BY city, temp_lo;
        SELECT DISTINCT city   FROM weather;
        SELECT DISTINCT city FROM weather   ORDER BY city;
        ##  使用了过滤 weather cities 两个表中city 一样的城市
        SELECT *
            FROM weather, cities
            WHERE city = name;
        ## 比较好的书写方式
        SELECT weather.city, weather.temp_lo, weather.temp_hi,
                   weather.prcp, weather.date, cities.location
                FROM weather, cities
                WHERE cities.name = weather.city;
        ## 也可以使用join
        SELECT * FROM weather INNER JOIN cities ON (weather.city = cities.name);

        ## 比较常见的写法
        SELECT *   FROM weather w, cities c WHERE w.city = c.name;

        ## 聚合
        SELECT max(temp_lo) FROM weather;
        SELECT city FROM weather   WHERE temp_lo = (SELECT max(temp_lo) FROM weather);

   ```



   CREATE TABLE cities (
        city     varchar(80) primary key,
        location point
);

## 外键

CREATE TABLE cities (
        city     varchar(80) primary key,
        location point
);

CREATE TABLE weather (
        city      varchar(80) references cities(city),
        temp_lo   int,
        temp_hi   int,
        prcp      real,
        date      date
);
## 事务
BEGIN;
UPDATE accounts SET balance = balance - 100.00
    WHERE name = 'Alice';
SAVEPOINT my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Bob';
-- 呀！加错钱了，应该用 Wally 的账号
ROLLBACK TO my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Wally';
COMMIT;

## 继承
CREATE TABLE cities (
  name       text,
  population real,
  altitude   int     -- (in ft)
);

CREATE TABLE capitals (
  state      char(2)
) INHERITS (cities);





coalesce使用技巧

```
select coalesce(null,2,3); // Return 2

select coalesce(null,null,3); // Return 3

select coalesce(1,2,3); // Return 1
```
