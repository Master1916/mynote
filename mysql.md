# mysql5.7 安装过程出现问题

 ```
//修改root密码
update mysql.user set authentication_string=password('root') where user='root' and Host = 'localhost';
// 修改权限 (注意这里用户名和密码替换成自己的) 可以实现远程登录
 GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
```

# MYSQL 联合索引
## 联合索引
```
查看
show index from test;
show keys from test;
添加
ALTER TABLE  test  ADD INDEX  bc_index_name ( a, b, c )

ALTER TABLE用来创建普通索引、UNIQUE索引或PRIMARY KEY索引
ALTER TABLE table_name ADD INDEX index_name (column_list)
ALTER TABLE table_name ADD UNIQUE (column_list)
ALTER TABLE table_name ADD PRIMARY KEY (column_list)


添加CREATE INDEX
CREATE INDEX可对表增加普通索引或UNIQUE索引。
CREATE INDEX index_name ON table_name (column_list)
CREATE UNIQUE INDEX index_name ON table_name (column_list)

删除索引
DROP INDEX index_name ON talbe_name
ALTER TABLE table_name DROP INDEX index_name

ALTER TABLE table_name DROP PRIMARY KEY


```

## 查看索引字段的解析
```
5．查看索引
mysql> show index from tblname;
mysql> show keys from tblname;
　　· Table
　　表的名称。
　　· Non_unique
　　如果索引不能包括重复词，则为0。如果可以，则为1。
　　· Key_name
　　索引的名称。
　　· Seq_in_index
　　索引中的列序列号，从1开始。
　　· Column_name
　　列名称。
　　· Collation
　　列以什么方式存储在索引中。在MySQL中，有值‘A’（升序）或NULL（无分类）。
　　· Cardinality
　　      索引中唯一值的数目的估计值。通过运行ANALYZE TABLE或myisamchk -a可以更新。
        基数根据被存储为整数的统计数据来计数，所以即使对于小型表，该值也没有必要是精确的。
        基数越大，当进行联合时，MySQL使用该索引的机会就越大。
　　· Sub_part
　　如果列只是被部分地编入索引，则为被编入索引的字符的数目。如果整列被编入索引，则为NULL。
　　· Packed
　　指示关键字如何被压缩。如果没有被压缩，则为NULL。
　　· Null
　　如果列含有NULL，则含有YES。如果没有，则该列含有NO。
　　· Index_type
　　用过的索引方法（BTREE, FULLTEXT, HASH, RTREE）。
　　· Comment
```

## explain 解释
###  Extra字段的意思

Using index
此查询使用了覆盖索引(Covering Index)，即通过索引就能返回结果，无需访问表。
若没显示"Using index"表示读取了表数据。

Using where
表示 MySQL 服务器从存储引擎收到行后再进行“后过滤”（Post-filter）。所谓“后过滤”，就是先读取整行数据，再检查此行是否符合 where 句的条件，符合就留下，不符合便丢弃。因为检查是在读取行后才进行的，所以称为“后过滤”。

Using temporary
使用到临时表
建表及插入数据：
create table a(a_id int, b_id int);
insert into a values(1,1),(1,1),(2,1),(2,2),(3,1);
mysql> explain select distinct a_id from a
        Extra: Using temporary
MySQL 使用临时表来实现 distinct 操作。

Using filesort
若查询所需的排序与使用的索引的排序一致，因为索引是已排序的，
因此按索引的顺序读取结果返回，
否则，在取得结果后，还需要按查询所需的顺序对结果进行排序，
这时就会出现 Using filesort 。
