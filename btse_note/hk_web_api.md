# hk_web    API 接口文档

## API 接口地址
```
生产环境
http://127.0.0.1:8080
测试环境
http://127.0.0.1:8080
开发环境
http://127.0.0.1:8080
```

### 接口列表
<a id="content-title"></a>

序号|接口|说明| 是否需要登录|维护人|
--------|----------------------|---------------------|--------|-----
1|[POST /validtype](#login)	|获取验证类型|否|
2|[POST /gt/register](#login)	|Geetest API1的验证|否|
3|[POST /user/random](#login)	|返回用户4位随机码 登录使用|否|
4|[GET  /login](#login)	|用户登录|否|
5|[POST /user/language](#login)	|返回用户4位随机码 登录使用|否|
6|[POST /user/favorite](#login)	|返回用户4位随机码 登录使用|否|
7|[POST /image/{uuid}](#login)	|返回用户4位随机码 登录使用|否|
8|[POST /uploadFile/bankpic/{surface}](#login)	|返回用户4位随机码 登录使用|否|
9|[POST /uploadFile/identity/{surface}](#login)	|返回用户4位随机码 登录使用|否|
10|[POST /uploadFile/paymentlist](#login)	|返回用户4位随机码 登录使用|否|
11|[POST /user/del_bankinfo](#login)	|返回用户4位随机码 登录使用|否|
12|[POST /user/save_alipay](#login)	|返回用户4位随机码 登录使用|否|
13|[POST /user/save_bankinfo](#login)	|返回用户4位随机码 登录使用|否|
14|[POST /user/modify_passwd](#login)	|返回用户4位随机码 登录使用|否|
15|[POST /user/security_new](#login)	|返回用户4位随机码 登录使用|否|
16|[POST /user/get_google_key_new](#login)	|返回用户4位随机码 登录使用|否|
17|[POST /user/googleValid](#login)	|返回用户4位随机码 登录使用|否|
18|[POST /user/untie_google_device_new](#login)	|返回用户4位随机码 登录使用|否|
19|[POST /user/google_auth_new](#login)	|返回用户4位随机码 登录使用|否|
20|[POST /user/bind_google_device_new](#login)	|返回用户4位随机码 登录使用|否|
21|[POST /user/check_user_exist](#login)	|返回用户4位随机码 登录使用|否|
22|[POST /register](#login)	|返回用户4位随机码 登录使用|否|
23|[POST /user/logout](#login)	|返回用户4位随机码 登录使用|否|
24|[POST /user/loginlog](#login)	|返回用户4位随机码 登录使用|否|
25|[POST /user/is2FA](#login)	|返回用户4位随机码 登录使用|否|
26|[POST /user/currencys](#login)	|返回用户4位随机码 登录使用|否|
27|[POST /user/currency](#login)	|返回用户4位随机码 登录使用|否|
28|[POST /minmaxinfo](#login)	|获取虚拟币 法币的 min max increment 和 decimal|是|
29|[POST /kyc/userinfo](#login)	|返回用户4位随机码 登录使用|否|
30|[POST /kyc/personal](#login)	|返回用户4位随机码 登录使用|否|
31|[POST /uploadpage](#login)	|返回用户4位随机码 登录使用|否|
32|[POST /user/referraldata](#login)	|返回用户4位随机码 登录使用|否|
33|[POST /user/activeAgain](#login)	|返回用户4位随机码 登录使用|否|
34|[POST /sso/logout](#login)	|返回用户4位随机码 登录使用|否|
35|[POST /sso/login](#login)	|返回用户4位随机码 登录使用|否|
36|[POST /verifyEmail](#login)	|返回用户4位随机码 登录使用|否|
37|[POST /validate/findback ](#login)	|返回用户4位随机码 登录使用|否|
38|[POST /validate/reset_pass](#login)	|返回用户4位随机码 登录使用|否|
39|[POST /validate/find_passwd_by_phone](#login)	|返回用户4位随机码 登录使用|否|
40|[POST /validate/reset_passwd_by_phone](#login)	|返回用户4位随机码 登录使用|否|
41|[POST /servlet/ValidateImageServlet](#login)	|返回用户4位随机码 登录使用|否|
42|[POST /capital/crypto/create_address](#login)	|返回用户4位随机码 登录使用|否|
43|[POST /capital/crypto/deposit_wallet_address](#login)	|返回用户4位随机码 登录使用|否|
44|[POST /capital/crypto/pre_withdraw](#login)	|返回用户4位随机码 登录使用|否|
45|[POST /capital/crypto/withdraw](#login)	|返回用户4位随机码 登录使用|否|
46|[POST /deposit/createVirtualAddress](#login)	|返回用户4位随机码 登录使用|否|
47|[POST /deposit/getVirtualAddress](#login)	|返回用户4位随机码 登录使用|否|
48|[POST /deposit/getBalanceInfo](#login)	|返回用户4位随机码 登录使用|否|
49|[POST /withdraw/coin_send](#login)	|返回用户4位随机码 登录使用|否|
50|[POST /withdraw/coinTransfer](#login)	|返回用户4位随机码 登录使用|否|
51|[POST /capital/pre_deposit](#login)	|返回用户4位随机码 登录使用|否|
52|[POST /capital/system_banks](#login)	|返回用户4位随机码 登录使用|否|
53|[POST /capital/deposit](#login)	|返回用户4位随机码 登录使用|否|
54|[POST /capital/pre_withdraw](#login)	|返回用户4位随机码 登录使用|否|
55|[POST /capital/user_bank_list](#login)	|返回用户4位随机码 登录使用|否|
56|[POST /capital/withdraw](#login)	|返回用户4位随机码 登录使用|否|
57|[POST /capital/pre_transfer](#login)	|返回用户4位随机码 登录使用|否|
58|[POST /capital/transfer](#login)	|返回用户4位随机码 登录使用|否|
59|[POST /account/selectAccountLog](#login)	|返回用户4位随机码 登录使用|否|
60|[POST /account/bank_list_new](#login)	|返回用户4位随机码 登录使用|否|
61|[POST /account/wallet_list_new](#login)	|返回用户4位随机码 登录使用|否|
62|[POST /account/cointype_list_new](#login)	|返回用户4位随机码 登录使用|否|
63|[POST /account/capitalInOutList](#login)	|返回用户4位随机码 登录使用|否|
64|[POST /limitTs/init](#login)	|用户登录|是|
65|[POST /limitTs/initUnLogin](#login)	|用户登录|是|
66|[POST /limitTs/buy](#login)	|用户登录|是|
67|[POST /limitTs/sell](#login)	|用户登录|是|
68|[GET /webSocket/info](#login)	|用户登录|是|
69|[GET /webSocket/333/nigjugjw/websocket](#login)	|用户登录|是|
70|[POST /initSpotIndex/USD](#login)	|用户登录|是|
71|[POST /index/announcement](#login)	|用户登录|是|
72|[POST /rate](#login)	|查询系统当前汇率|是|
73|[POST /user/referral](#login)	|获取用户推广信息接口|是|
74|[POST /inquire/allPending](#login)	|所有等待的交易订单(|是|
75|[POST /inquire/volume](#login)	|获取平台交易额|是|
76|[POST /inquire/regist](#login)	|用户登录|是|
77|[POST /inquire/pending](#login)	|用户登录|是|
78|[POST /inquire/trade](#login)	|用户登录|是|
79|[POST /inquire/initOrderBook](#login)	|用户登录|是|
80|[POST /inquire/tradeHistorySummary](#login)	|卖|是|
81|[POST /inquire/cancel](#login)	|卖|是|
82|[POST /inquire/initOrderBook](#login)	|卖|是|
83|[POST /inquire/tradeDetails](#login)	|卖|是|
84|[POST /inquire/rate](#login)	|卖|是|
85|[GET /tradingView/time](#login)	|用户登录|是|
86|[GET /tradingView/symbols](#login)	|用户登录|是|
87|[GET /tradingView/history](#login)	|交易历史|是|
88|[GET /tradingView/config](#login)	|用户登录|是|
89|[POST /marketTs/initMarketPrice](#login)	|获取最新市场价格|是|
90|[POST /marketTs/buy](#login)	|买|是|
91|[POST /marketTs/sell](#login)	|卖|是|
92|[POST /marketTs/price](#login)	|卖|是|
93|[POST /pegTs/buy](#login)	|买|是|
94|[POST /pegTs/sell](#login)	|卖|是|
95|[POST /account/capitalInOutList](#login)	|卖|是|
96|[GET /user/security_new](#login)	|卖|是|
97|[GET /account/index](#login)	|获取银行卡列表|是|
98|[GET /account/add](#login)	|卖|是|
99|[GET /account/unbind](#login)	|卖|是|
100|[POST /otcorder/mine](#login)|我的otc订单列表|是|
101|[POST /otcorder/create](#login)|买/卖 生成订单表|是|
102|[POST /otcorder/c_confirm](#login)|我的otc订单列表|是|
103|[POST /otcorder/o_confirm](#login)|我的otc订单列表|是|
104|[POST /otcorder/orders](#login)|我的otc订单列表|是|
105|[POST /otcorder/state](#login)|我的otc订单列表|是|
106|[POST /otcorder/order](#login)|我的otc订单列表|是|
107|[POST /otcoffer/list](#login)	|获取用户场外发布的虚拟币买卖信息|是|
108|[POST /otcoffer/mine](#login)|我的otc订单列表|是|
109|[POST /otcoffer/modifyForword](#login)|我的otc订单列表|是|
110|[POST /otcoffer/create](#login)|我的otc订单列表|是|
111|[POST /otcoffer/modify](#login)|我的otc订单列表|是|
112|[POST /otcoffer/someone](#login)|我的otc订单列表|是|
113|[POST /otcoffer/state](#login)|我的otc订单列表|是|
114|[POST /otcoffer/offer](#login)|我的otc订单列表|是|
115|[POST /otccomment/create](#login)|我的otc订单列表|是|
116|[POST /otccomment/list](#login)|我的otc订单列表|是|
117|[POST /otcrating/rate](#login)|我的otc订单列表|是|
118|[POST /otcrating/mine](#login)|我的otc订单列表|是|
119|[POST /otcrating/someone](#login)|我的otc订单列表|是|
120|[POST /notification/mine](#login)	|获取用户的通知消息|是|
121|[POST /notification/read](#login)	|获取用户的通知消息|是|
122|[POST /otctrade/trades](#login)	|获取用户的通知消息|是|
123|[POST /otctrade/statistics](#login)	|获取用户的通知消息|是|
124|[POST /otctrade/lastPrice](#login)	|获取用户的通知消息|是|
125|[POST /otcprofile/profile](#login)	|获取用户的通知消息|是|
126|[POST /apiKey](#login)	|获取用户的通知消息|是|
127|[GET /apiKey](#login)	|获取用户的通知消息|是|
128|[GET /apiKey/{apiKeyId}](#login)	|获取用户的通知消息|是|
129|[GET /coin/faitMarket](#login)	|获取用户的通知消息|是|
130|[GET /coin/markets](#login)	|获取用户的通知消息|是|
131|[GET /coin/marketType](#login)	|获取用户的通知消息|是|
132|[GET /coin/ofType](#login)	|获取用户的通知消息|是|
133|[GET /coin/selectMarket](#login)	|获取用户的通知消息|是|
134|[GET /coin/userMarket](#login)	|获取用户的通知消息|是|
135|[POST /country/all](#login)	|获取用户的通知消息|是|
136|[GET /marketPrice/overView](#login)	|获取用户的通知消息|是|
137|[POST /comment/add](#login)	|获取用户的通知消息|是|
138|[POST /comment/list](#login)	|获取用户的通知消息|是|
139|[POST  /merchant/list](#login)	|获取用户的通知消息|是|
140|[POST /merchant/favorite](#login)	|获取用户的通知消息|是|
141|[POST /merchant/offerDetail](#login)	|获取用户的通知消息|是|
142|[POST /merchant/orderDetail](#login)	|获取用户的通知消息|是|
143|[POST /merchant/detail](#login)	|获取用户的通知消息|是|
144|[POST /merchant/profile](#login)	|获取用户的通知消息|是|
145|[POST /merchant/createOrder](#login)	|获取用户的通知消息|是|
146|[POST /merchant/userConfirm](#login)	|获取用户的通知消息|是|
147|[POST /user/orders](#login)	|获取用户的通知消息|是|
148|[POST /order/state](#login)	|获取用户的通知消息|是|
149|[POST /order/rating](#login)	|获取用户的通知消息|是|
150|[POST /merchant/transferForwad](#)	|获取用户的通知消息|是|
151|[POST /merchant/transfer](#)	|获取用户的通知消息|是|
152|[GET /api/v1/restapi/account](#)	|获取用户的通知消息|是|
153|[GET /api/v1/restapi/fills](#)	|获取用户的通知消息|是|
154|[GET /api/v1/restapi/orders](#)	|获取用户的通知消息|是|
155|[GET /api/v1/restapi/pending](#)	|获取用户的通知消息|是|
156|[GET /api/v1/restapi/order](#loin)	|获取用户的通知消息|是|
157|[GET /api/v1/restapi/deleteOrder](#)	|获取用户的通知消息|是|
158|[GET /api/v1/restapi/products](#)	|获取用户的通知消息|是|
159|[POST /user/check/2FA](#)	|2FA校验|否|




<a id="login"></a>

##### [返回目录↑](#content-title)
### 1\. 用户登录 login
#### 1\.1请求参数
  参数名      |类型       |是否必填   |示例值        | 说明
  ------------|-----------|-----------|-------------|-----
  type   |Integer     |否         |1  |用户账号名称
  loginName   |String     |是         |zhangpan  |用户账号名称
  password    |String     |是         |e3565cbb23b0b5b774f50e532d88306d68c9c3a7|用户密码密码需要通过加密
  userid   |String     |否         |e3565cbb23  |极验校验参数
  challenge   |String     |否         |e3565cbb23  |极验校验参数
  validate   |String     |否         |e3565cbb23  |极验校验参数
  seccode   |String     |否         |e3565cbb23  |极验校验参数
  lang   |String     |否         |1  |用户语言
  recaptcha   |String     |否         |123453  |google验证码校验


### 1\.2返回结果
  ```
  没有2FA
  {
      "code": 1,
      "msg": "Success",
      "time": 1540355802927,
      "data": {
          "isFiat": true,
          "isGoogleBind": false,
          "lang": 3,
          "email": "15201059026@126.com",
          "token": "USER_TOKEN_LOGIN_67e103b0761e60683e83c559be18d40c_6ee858676bbb409485a978e4b8dceb4c",
          "username": "zhangpan"
      }
  }
  有2FA
  {
      "code": 1,
      "msg": "Success",
      "time": 1542168616547,
      "data": {
          "isFiat": true,
          "isGoogleBind": true,
          "lang": 3,
          "email": "qin",
          "token": "USER_2FA_LOGIN_TOKEN_KEY_f0e52b27a7a5d6a1a87373dffa53dbe5_8cf599437f674763bc0a73de8804b194",
          "username": "qinjian01"
      }
  }
  ```
#### 1\.3返回参数说明
 字段       |字段类型       |字段说明
 ------------|-----------|-----------
 token       |string        |token值
#### 1\.4错误状态码
 状态码       |说明
 ------------|-----------
 code : 10006       |密码加密错误



 <a id="/user/check/2FA"></a>

#####  [返回目录↑](#content-title)
###   2\. 用户2FA登陆  /user/check/2FA
####  2\.1请求参数
参数名      |类型       |是否必填   |示例值     | 说明
------------|-----------|-----------|---------|-----
token       |String     |是         |USER_2FA_LOGIN_TOKEN_KEY_f0e52b27a | 2fa 验证token
otpCode     |String     |是         |12322    |2FA验证码

###  2\.2返回结果
   ```
   {
       "code": 1,
       "msg": "Success",
       "time": 1542168670566,
       "data": {
           "token": "USER_TOKEN_LOGIN_f0e52b27a7a5d6a1a87373dffa53dbe5_9777e8d4218d4ffeaa28fdb24917c786",
           "userinfo": null,
           "secretKey": null,
           "errorcode": null,
           "accountTokenInfo": null,
           "tokenUuid": "9777e8d4218d4ffeaa28fdb24917c786",
           "isFiat": false,
           "fiat": false,
           "bandGoogle": false
       }
   }
   ```
