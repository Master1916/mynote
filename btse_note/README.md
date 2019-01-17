# HK_WEB


f_user 用户表
system_coin_type 系统支持的货币类型表
user_coin_wallet 用户币钱包表 该表通过uid 和f_user 关联，通过 coin_id和 system_coin_type表关联
f_user_favorite_wallet 用户喜欢的钱包
trade  用户交易表



## OTC
otc_notification  用户通知表
otc_offer 场外买卖信息表
otc_rating 用户评级表
otc_orders otc订单表


1、系统在启动的时候加载setting.comfig文件 按行读取文件内容，把键值对放入map中
2、hk_web 项目使用的验证码验证功能依赖于 price.jar 项目 该项目使用springboot搭建启动后修改
HK_WEB中配置mail.server即可
3、使用postman访问admin的时候需要使用70的系统先登录获取cookie 添加到postman在对其他接口进行访问
例如cookie：

ADMIN_USER_TOKEN=ADMIN_TOKEN_LOGIN_21232f297a57a5a743894a0e4a801fc3_80e7f22b-9ee0-44c7-accb-0c8f079ce1b4; path=/; domain=localhost; Expires=Tue, 19 Jan 2038 03:14:07 GMT;
