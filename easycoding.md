# EasyCoding

## 1、原码 反码 补码 概念理解
https://www.cnblogs.com/zhangziqiu/archive/2011/03/30/ComputerCode.html

## 2、 左移运算符

左移运算符<<使指定值的所有位都左移规定的次数。
1）它的通用格式如下所示：
value << num
num 指定要移位值value 移动的位数。
左移的规则只记住一点：丢弃最高位，0补最低位
如果移动的位数超过了该类型的最大位数，那么编译器会对移动的位数取模。如对int型移动33位，实际上只移动了33%32=1位。
