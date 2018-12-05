# websocket 消息体定义

## chat 聊天 用户发送和接受消息体
```
{
  "type":"chat"             //必填         
  "from":"tom",             //必填    
  "to":"lucy",              //必填   
  "time":"201801011121",    //必填   
  "orderId" "121212",       //必填   
  "content": "xxx"          //必填   


  "chatId": "xxx"            // 先不加
  "isRead" : "false"         // 先不加
}
```

## user 变更金额 发送该消息到客户端
```
//用户修改完 amount 后
//服务端 websocket 通知对方，对方接到type
//等于changeamount的信息后取出orderId
//前端可以直接变更状态为商户已变更订单 并且取出 最新amount 展示
//也可以直通过orderid 获取最新订单信息
{
  "type":"changeamount"              //必填     
  "from":"tom",        //用户     //必填   
  "to":"lucy",           //商户   //必填   
  "time":"201801011121",          //必填   
  "orderId": "121212",            //必填
  "old_amount": "1000"，          // 原先数量  必填
  "amount":      "2000"           // 变更后数量  必填
}
```

## user 打款 发送该消息到客户端
```
//用户打款后
//服务端 websocket 通知商户，对方接到type
//等于userpay的信息后取出orderId
//通过orderid 获取最新订单信息
{
  "type":"userpay"              //必填     
  "from":"tom",        //用户     //必填   
  "to":"lucy",           //商户   //必填   
  "time":"201801011121",          //必填   
  "orderId" "121212",             //必填  
}
```

## user 转vc 发送该消息到客户端
```
//用户转vc后
//服务端 websocket 通知商户，对方接到type
//等于usertransfer的信息后取出orderId
//也可以直通过orderid 获取最新订单信息

{
  "type":"usertransfer"              //必填     
  "from":"tom",        //用户     //必填   
  "to":"lucy",           //商户   //必填   
  "time":"201801011121",          //必填   
  "orderId" "121212",             //必填   
}
```

## merchant 变更费率 发送该消息到客户端
```

//商户修改完order rate后
//服务端 websocket 通知对方，对方接到type
//等于changerate的信息后取出orderId
//前端可以直接变更状态为商户已变更订单 并且取出 rate 展示
//也可以直通过orderid 获取最新订单信息
{
  "type":"changerate"             //必填  
  "from":"tom",      // 商户      //必填  
  "to":"lucy",           //用户   //必填  
  "time":"201801011121",          //必填  
  "orderId": "121212",             //必填  
  "old_rate":"0.9",               //  之前费率   必填  
  "rate" :    "1"                // 修改后的费率  必填  
}
```
## merchant 付款 发送该消息到客户端
```
{
  //商户在接收到用户vc后，转账给用户
  //商户付款后通过websocket 通知对方，对方接到type
  //等于merchantpay的信息后取出orderId
  //获取最新的订单信息

  "type":"merchantpay"             //必填  
  "from":"tom",      // 商户      //必填  
  "to":"lucy",           //用户   //必填  
  "time":"201801011121",          //必填  
  "orderId" "121212",             //必填  
}
```

## merchant  转vc 发送该消息到客户端
```
 //商户在接收到用户付款后，转移vc到用户钱包
 //商户转款后通过websocket 通知对方对方接到type
 //等于merchanttransfer的信息后取出orderId
 //获取最新的订单信息
{
  "type":"merchanttransfer"             //必填  
  "from":"tom",      // 商户      //必填  
  "to":"lucy",           //用户   //必填  
  "time":"201801011121",          //必填  
  "orderId" "121212",             //必填  
}
```


## note:
### 之前设计的功能
之前考虑服务端在接到order 信息变更的时候通过websocket通知用户
哪一个orderId 变更了。用户可以直接通过action请求最新的order信息。
content 考虑用在notification 在用户没有在聊天窗口下可以看到有哪些订单有变更。

也考虑在用户不在线的时候吧content内容放到notification 表中 方便用在登录的时候读取最新信息。

### 变更后的功能
去掉content 不考虑notification功能。
只考虑在商户和用户聊天的过程中任何一方变更了order的信息都能通过websocket通知对方，并且在页面显示出来。除了变更order表数据库中的数据，不记录该order的变更历史
