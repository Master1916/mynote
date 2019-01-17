

### 开启和关闭命令
/atlassian/confluence/bin$ sh stop-confluence.sh
/atlassian/confluence/bin$ sh start-confluence.sh


https://blog.whsir.com/post-2997.html
## 安装过程中需要重启，在替换了包之后

confluence中文显示乱码问题
http://www.voidcn.com/article/p-fnttzmpr-bsd.html
使用同事建议的
http://www.voidcn.com/article/p-fnttzmpr-bsd.html
修改/var/atlassian/application-data/confluence/confluence.cfg.xml

找到数据库定位的那一条hibernate.connection.url，在指定数据库的最后url的最后添加&amp;useUnicode=true&amp;characterEncoding=utf8

测试新建中文空间成功，删掉之前输入的中文乱码。

http://192.168.123.10:8090

username:admin
password:zhangpan

username：wzq
password：wangzhuoqun
