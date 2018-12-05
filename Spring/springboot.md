## 1、在springboot启动的时候做一些配置的加载
可以继承CommandLineRunner类，可以设置加载顺序，例如：

``` java
@Component
@Order(value = 2)
public class SystemInit implements CommandLineRunner{
  @Autowired
     private SystemRedisInit systemRedisInit;
     @Override
     public void run(String... args) throws Exception {
         systemRedisInit.redisInit();
         System.out.println("initilize finish...");
     }  
}
```
## 2、ApplicationEvent 配合ApplicationListener 可以实现事件的监听
## 3、SpringBootServletInitializer 在springboot环境下面打出war包
## 4、springboot中参数转换
[1](https://www.cnblogs.com/daxin/archive/2013/11/02/3404374.html)
[2](https://blog.csdn.net/u014527058/article/details/62883573)

## springboot 面临的问题
网络延迟
分布式事务
异步消息

 服务的监控 日志的记录
 服务状态 断路器状态
 吞吐量

 84页
