# admin_layui   API 接口文档

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
1|[POST /system/rate/update](#system_rate_update)	|更新系统货币的汇率信息|是| zhang
2|[GET /system/rates](#system_rates)	|获取系统所有币的汇率信息|是|zhang
3|[GET /system/rate/update/redis](#login)	|更新 redis 用户系统汇率信息|是|zhang
4|[GET /system/history/rates](#login)	|获取用户系统汇率历史信息|是|zhang


<a id="system_rate_update"></a>
##### [返回目录↑](#content-title)
###  system/rate/update
### 1\. 更新系统货币的汇率信息
#### 1\.1请求参数
  参数名      |类型       |是否必填   |示例值        | 说明
  ------------|-----------|---------  |-------------|-----
  currency    |String     |是         |CNY          |用户账号名称
  buyRate     |String     |是         |6.7865       |买的货币汇率
  sellRate    |String     |是         |7.6666       |买的货币汇率
  id          |String     |是         | 12          | id


### 1\.2返回结果
  ```
  {
    "code": 1,
    "msg": "Success",
    "time": 1540786613979,
    "data": null
}
  ```
#### 1\.3错误状态码
 状态码       |说明
 ------------|-----------
 code: 1      | success
 code : 10006    |密码加密错误



 <a id="system_rates"></a>

##### [返回目录↑](#content-title)
###  system/rates
### 2\. 更新系统货币的汇率信息
#### 2\.1请求参数
   参数名      |类型       |是否必填   |示例值        | 说明
   ------------|-----------|---------  |-------------|-----

 ### 2\.2返回结果
   ```
   "code": 1,
    "msg": "Success",
    "time": 1540786817823,
    "data": [
        {
            "id": 1,
            "currency": "USDT",
            "buyrate": 0.95,
            "sellrate": 1.05,
            "xeBuyrate": 0.95,
            "xeSellrate": 1.05,
            "rate": 1,
            "datetime": 0,
            "operator": null
        },
        {
            "id": 5,
            "currency": "EUR",
            "buyrate": 0.86625,
            "sellrate": 0.88375,
            "xeBuyrate": 0.868527,
            "xeSellrate": 0.886073,
            "rate": 0.875,
            "datetime": 0,
            "operator": null
        }]
   ```



#### 2\.4错误状态码
   状态码       |说明
   ------------|-----------
   code: 1      | success
   code : 10006    |密码加密错误

#### 2\.3返回参数说
  字段        |字段类型   |字段说明
  ------------|----------|------------
  currency    |string     |货币类型
  buyrate     |string     |该货币买入汇率
  sellrate    |string     |该货币卖出汇率
  xeBuyrate   |string     |ex系统该货币买入汇率
  xeSellrate  |string     |ex系统该货币卖出汇率
  rate        |string     |ex 系统该货币的汇率 作为参考 ref
  operator    |string     |操作人
