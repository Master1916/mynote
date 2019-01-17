
# marketplace table alter

### Table structure for   merchant_favorites  
```
DROP TABLE IF EXISTS "public"."merchant_favorites";
CREATE TABLE "public"."merchant_favorites" (
  "id" int4 NOT NULL,
  "user_id" int4,
  "offer_id" int4,
  "create_time" int8,
  "update_time" int8
);

ALTER TABLE "public"."merchant_favorites" ADD CONSTRAINT "merchant_favorites_pkey" PRIMARY KEY ("id");
```
#### add merchant_favorites seq
```
CREATE SEQUENCE merchant_favorites_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
ALTER TABLE merchant_favorites ALTER COLUMN id SET DEFAULT nextval('merchant_favorites_seq');
```
### Table structure for merchant_offer  
```
DROP TABLE IF EXISTS "public"."merchant_offer";
CREATE TABLE "public"."merchant_offer" (
  "offer_id" int4 NOT NULL,
  "merchant_id" varchar(50) COLLATE "pg_catalog"."default",
  "country" varchar(100) COLLATE "pg_catalog"."default",
  "side" varchar(1) COLLATE "pg_catalog"."default",
  "currency" varchar(10) COLLATE "pg_catalog"."default",
  "parents" varchar(255) COLLATE "pg_catalog"."default",
  "handling_fees" varchar(255) COLLATE "pg_catalog"."default",
  "is_bank" int2,
  "is_ali" int2,
  "is_wechat" int2,
  "is_paypal" int2,
  "is_meetup" int2,
  "is_others" int2,
  "others_note" varchar(100) COLLATE "pg_catalog"."default",
  "trade_min" numeric(24,10),
  "trade_max" numeric(24,10),
  "nodes" text COLLATE "pg_catalog"."default",
  "status" int2,
  "create_time" int8,
  "update_time" int8
)
;
COMMENT ON COLUMN "public"."merchant_offer"."offer_id" IS '唯一id';
COMMENT ON COLUMN "public"."merchant_offer"."side" IS 'B-Buy  S-Sell';
COMMENT ON COLUMN "public"."merchant_offer"."status" IS '0-new  1-published ';


ALTER TABLE "public"."merchant_offer" ADD CONSTRAINT "merchant_offer_pkey" PRIMARY KEY ("offer_id");
```
#### add merchant_offer_seq
```
CREATE SEQUENCE merchant_offer_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
ALTER TABLE merchant_offer ALTER COLUMN offer_id SET DEFAULT nextval('merchant_offer_seq');
```
#### Table structure for  merchant_order  
```
DROP TABLE IF EXISTS "public"."merchant_order";
CREATE TABLE "public"."merchant_order" (
  "order_id" int4 NOT NULL,
  "offer_id" int4,
  "side" varchar(1) COLLATE "pg_catalog"."default",
  "user_id" varchar(50) COLLATE "pg_catalog"."default",
  "merchant_id" varchar(50) COLLATE "pg_catalog"."default",
  "parents" varchar(255) COLLATE "pg_catalog"."default",
  "handling_fees" varchar(255) COLLATE "pg_catalog"."default",
  "transfer_fees" numeric(24,10),
  "amount" numeric(24,10),
  "currency" varchar(10) COLLATE "pg_catalog"."default",
  "status" int2,
  "user_read" bool,
  "merchant_read" bool,
  "create_time" int8,
  "update_time" int8,
  "receive_amount" numeric(24,10),
  "confirm_status" int2
)
;
COMMENT ON COLUMN "public"."merchant_order"."order_id" IS 'order id唯一';
COMMENT ON COLUMN "public"."merchant_order"."side" IS 'B-Buy  S-Sell';
COMMENT ON COLUMN "public"."merchant_order"."parents" IS 'contains the entire parent tree';
COMMENT ON COLUMN "public"."merchant_order"."handling_fees" IS 'Fees of the entire parent line';
COMMENT ON COLUMN "public"."merchant_order"."status" IS '0-New 1-Submitted';

ALTER TABLE "public"."merchant_order" ADD CONSTRAINT "merchant_orders_pkey" PRIMARY KEY ("order_id");
```

#### add merchant_order_seq
```
CREATE SEQUENCE merchant_order_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
ALTER TABLE merchant_order ALTER COLUMN order_id SET DEFAULT nextval('merchant_order_seq');
```
#### Table structure for  merchant_settings  
```
DROP TABLE IF EXISTS "public"."merchant_settings";
CREATE TABLE "public"."merchant_settings" (
  "id" int4 NOT NULL,
  "merchant_id" varchar(50) COLLATE "pg_catalog"."default",
  "currency" varchar(20) COLLATE "pg_catalog"."default",
  "upline_fee" numeric(24,10),
  "current_balance" numeric(24,10),
  "allocated_amt" numeric(24,10),
  "total_balance" numeric(24,10),
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."merchant_settings"."id" IS '唯一id';
COMMENT ON COLUMN "public"."merchant_settings"."merchant_id" IS '商户id  实际是userid';
COMMENT ON COLUMN "public"."merchant_settings"."currency" IS '商户持有的币别';
COMMENT ON COLUMN "public"."merchant_settings"."upline_fee" IS '上级商户设置的最低费率 待商议';
COMMENT ON COLUMN "public"."merchant_settings"."current_balance" IS '商户可支配的总额度';

ALTER TABLE "public"."merchant_settings" ADD CONSTRAINT "merchant_settings_pkey" PRIMARY KEY ("id");
```
#### add merchant_settings_seq
```
CREATE SEQUENCE merchant_settings_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
ALTER TABLE merchant_settings ALTER COLUMN id SET DEFAULT nextval('merchant_settings_seq');

```

#### Table structure for merchant_rating
```
DROP TABLE IF EXISTS "public"."merchant_rating";
CREATE TABLE "public"."merchant_rating" (
  "rating_id" int4 NOT NULL,
  "order_id" int4,
  "user_id" varchar(50) COLLATE "pg_catalog"."default",
  "user_rating" int2,
  "merchant_rating" int2,
  "user_notes" text COLLATE "pg_catalog"."default",
  "merchant_notes" text COLLATE "pg_catalog"."default",
  "create_time" int8,
  "update_time" int8
)
;
ALTER TABLE "public"."merchant_rating" ADD CONSTRAINT "merchant_rating_pkey" PRIMARY KEY ("rating_id");
```
#### add merchant_rating_seq

```
CREATE SEQUENCE merchant_rating_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
ALTER TABLE merchant_rating ALTER COLUMN rating_id SET DEFAULT nextval('merchant_rating_seq');
```



### Table structure for merchant_transaction
 ```
DROP TABLE IF EXISTS "public"."merchant_transaction";
CREATE TABLE "public"."merchant_transaction" (
  "id" int4 NOT NULL DEFAULT,
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "order_id" varchar(36) COLLATE "pg_catalog"."default",
  "currency" varchar(10) COLLATE "pg_catalog"."default",
  "fees" numeric(16,4),
  "merchant_0" varchar(255) COLLATE "pg_catalog"."default",
  "merchant_1" varchar(255) COLLATE "pg_catalog"."default",
  "merchant_2" varchar(255) COLLATE "pg_catalog"."default",
  "fee_0" numeric(16,4) DEFAULT 0,
  "fee_1" numeric(16,4),
  "fee_2" numeric(16,4),
  "side" int2,
  "fiat" numeric(16,4),
  "vc" numeric(16),
  "datetime" int8
)
;
COMMENT ON COLUMN "public"."merchant_transaction"."merchant_0" IS 'one';
COMMENT ON COLUMN "public"."merchant_transaction"."merchant_1" IS 'house';
COMMENT ON COLUMN "public"."merchant_transaction"."merchant_2" IS 'merchant';
COMMENT ON COLUMN "public"."merchant_transaction"."fee_0" IS 'always 0';
COMMENT ON COLUMN "public"."merchant_transaction"."fee_1" IS 'fees percent to upline(M0)';
COMMENT ON COLUMN "public"."merchant_transaction"."fee_2" IS 'fees percent to upline(M1)';
COMMENT ON COLUMN "public"."merchant_transaction"."side" IS '1:deposit 2: withdrawal';

ALTER TABLE "public"."merchant_transaction" ADD CONSTRAINT "merchant_transaction_pkey" PRIMARY KEY ("id");
```
#### add merchant_transaction_seq

```
CREATE SEQUENCE merchant_transaction_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
ALTER TABLE merchant_transaction ALTER COLUMN id SET DEFAULT nextval('merchant_transaction_seq');
```
###  Table structure for chat_log
```
DROP TABLE IF EXISTS "public"."chat_log";
CREATE TABLE "public"."chat_log" (
  "chat_id" int4,
  "from_id" int4,
  "to_id" int4,
  "ref_id" int4,
  "comment" varchar(1000) COLLATE "pg_catalog"."default",
  "type" int2,
  "create_time" int4,
  "is_read" bool
)
;
COMMENT ON COLUMN "public"."chat_log"."ref_id" IS 'order_id';
COMMENT ON COLUMN "public"."chat_log"."type" IS '0-OTC  1-Merchant';
```
#### add chat_log_seq
```
CREATE SEQUENCE chat_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
alter table chat_log alter column chat_id set default nextval('chat_log_seq');
```

#### Table structure for notification
```
DROP TABLE IF EXISTS "public"."notification";
CREATE TABLE "public"."notification" (
  "notification_id" int4,
  "notification_user" varchar(50) COLLATE "pg_catalog"."default",
  "from_user" varchar(50) COLLATE "pg_catalog"."default",
  "message" varchar(1000) COLLATE "pg_catalog"."default",
  "message_type" int2,
  "notification_type" int2,
  "ref_id" int4,
  "is_read" bool,
  "create_time" int4,
  "update_time" int4
)
;
COMMENT ON COLUMN "public"."notification"."message_type" IS '1 - Merchant  2 - OTC';
COMMENT ON COLUMN "public"."notification"."notification_type" IS '1 - Information  2 - Error';
COMMENT ON COLUMN "public"."notification"."ref_id" IS 'References merchant or OTC order ID';
```

#### add notification_seq
```
CREATE SEQUENCE notification_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
alter table notification alter column notification_id set default nextval('notification_seq');
```
### 修改f_user 表 添加online字段

```
alter table f_user add column online_num int default 0;
COMMENT ON COLUMN public.f_user.online_num IS '0:表示不在线  大于0表示在线 并且表示该用户在多少个地方同时登录';
```









### 修改merchant_transtrin seq
```
CREATE SEQUENCE merchant_transaction_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
ALTER TABLE merchant_transaction ALTER COLUMN id SET DEFAULT nextval('merchant_transaction');
```
