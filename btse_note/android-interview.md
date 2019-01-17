## java 部分

#### 1、java 语言 的特性
#### 2、String StringBuffer StringBuilder 三个类的区别和使用情景
#### 3、set list map 容器类的了解，对ArrayList LinkList 了解 hashMap的实现原理
#### 4、线程的实现方式，线程安全的理解，线程池的使用 , 线程的生命周期
#### 5、jvm 中gc的理解
#### 6、link链表的翻转


## android 部分
#### 1、 Android的四大组件是哪些，它们的作用？

Activity：Activity是Android程序与用户交互的窗口，是Android构造块中最基本的一种，它需要为保持各界面的状态，做很多持久化的事情，妥善管理生命周期以及一些跳转逻辑
service：后台服务于Activity，封装有一个完整的功能逻辑实现，接受上层指令，完成相关的事物，定义好需要接受的Intent提供同步和异步的接口
Content Provider：是Android提供的第三方应用数据的访问方案，可以派生Content Provider类，对外提供数据，可以像数据库一样进行选择排序，屏蔽内部数据的存储细节，向外提供统一的借口模型，大大简化上层应用，对数据的整合提供了更方便的途径
BroadCast Receiver：接受一种或者多种Intent作触发事件，接受相关消息，做一些简单处理，转换成一条Notification，统一了Android的事件广播模型

#### 2、 请介绍下Android中常用的五种布局。（起码可以答出2-3种）

常用五种布局方式，分别是：

FrameLayout（框架布局），
LinearLayout （线性布局），
AbsoluteLayout（绝对布局），
RelativeLayout（相对布局），

TableLayout（表格布局）。

#### 3.请介绍下Android的数据存储方式。

答：使用SharedPreferences存储数据；文件存储数据；SQLite数据库存储数据；使用ContentProvider存储数据；网络存储数据；
#### 4. activity的启动模式有哪些？是什么含义？
答：在android里，有4种activity的启动模式，分别为：
“standard” (默认)
“singleTop”
“singleTask”
“singleInstance”
#### 5. 请描述下Activity的生命周期。
答：activity的生命周期方法有：onCreate()、onStart()、onReStart()、onResume()、onPause()、onStop()、onDestory()；
#### 6、 java中如何引用本地语言
可以用JNI（java native interface  java 本地接口）接口 。
#### 7、 谈谈Android的IPC（进程间通信）机制
IPC是内部进程通信的简称， 是共享"命名管道"的资源。
Android中的IPC机制是为了让Activity和Service之间可以随时的进行交互，
故在Android中该机制，只适用于Activity和Service之间的通信，类似于远程方法调用，
类似于C/S模式的访问。通过定义AIDL接口文件来定义IPC接口。Servier端实现IPC接口，Client端调用IPC接口本地代理。
#### 8、 NDK是什么
NDK是一些列工具的集合，NDK提供了一系列的工具，帮助开发者迅速的开发C/C++的动态库，并能自动将so和java 应用打成apk包。
#### 9. Handler的原理
Android中主线程是不能进行耗时操作的，子线程是不能进行更新UI的。所以就有了handler，它的作用就是实现线程之间的通信。

handler整个流程中，主要有四个对象，handler，Message,MessageQueue,Looper。当应用创建的时候，就会在主线程中创建handler对象，

我们通过要传送的消息保存到Message中，handler通过调用sendMessage方法将Message发送到MessageQueue中，Looper对象就会不断的调用loop()方法

不断的从MessageQueue中取出Message交给handler进行处理。从而实现线程之间的通信。



#### 10、什么是ANR
ANR全名Application Not Responding, 也就是"应用无响应". 当操作在一段时间内系统无法处理时, 系统层面会弹出上图那样的ANR对话框

#### 11、如何保证Service不被杀死？

提供进程优先级，降低进程被杀死的概率
方法一：监控手机锁屏解锁事件，在屏幕锁屏时启动1个像素的 Activity，在用户解锁时将 Activity 销毁掉。
方法二：启动前台service。
方法三：提升service优先级：
在AndroidManifest.xml文件中对于intent-filter可以通过android:priority = "1000"这个属性设置最高优先级，1000是最高值，如果数字越小则优先级越低，同时适用于广播。
在进程被杀死后，进行拉活
方法一：注册高频率广播接收器，唤起进程。如网络变化，解锁屏幕，开机等
方法二：双进程相互唤起。
方法三：依靠系统唤起。
方法四：onDestroy方法里重启service：service +broadcast 方式，就是当service走ondestory的时候，发送一个自定义的广播，当收到广播的时候，重新启动service；
依靠第三方
根据终端不同，在小米手机（包括 MIUI）接入小米推送、华为手机接入华为推送；其他手机可以考虑接入腾讯信鸽或极光推送与小米推送做 A/B Test。


#### 12、简述下Acitivty任务栈和使用方法

任务栈是一种后进先出的结构。位于栈顶的Activity处于焦点状态,当按下back按钮的时候,栈内的Activity会一个一个的出栈,

并且调用其onDestory()方法。如果栈内没有Activity,那么系统就会回收这个栈,每个APP默认只有一个栈,以APP的包名来命名.

1、standard：默认模式：每次启动都会创建一个新的activity对象，放到目标任务栈中
2、singleTop：判断当前的任务栈顶是否存在相同的activity对象，如果存在，则直接使用，如果不存在，那么创建新的activity对象放入栈中
3、singleTask：在任务栈中会判断是否存在相同的activity，如果存在，那么会清除该activity之上的其他activity对象显示，如果不存在，则会创建一个新的activity放入栈顶
4、singleIntance：会在一个新的任务栈中创建activity，并且该任务栈种只允许存在一个activity实例，其他调用该activity的组件会直接使用该任务栈种的activity对象
方法一：
使用android:launchMode="standard|singleInstance|single Task|singleTop"来控制Acivity任务栈。
方法二：
Intent Flags：
Intent intent=new Intent();
intent.setClass(MainActivity.this, MainActivity2.class);
intent.addFlags(Intent. FLAG_ACTIVITY_CLEAR_TOP);
startActivity(intent);

#### 13、Android 事件分发机制原理
    Android 绘图机制原理
    WindowManager 的相关知识
    进程间传输方式
    Java 内存管理机制
    一些常用的 list,map 原理，以及子类之间的差别


    基础知识 – 四大组件（生命周期，使用场景，如何启动）
    java基础 – 数据结构，线程，mvc框架
    通信 – 网络连接（HttpClient，HttpUrlConnetion），Socket
    数据持久化 – SQLite，SharedPreferences，ContentProvider
    性能优化 – 布局优化，内存优化，电量优化
    安全 – 数据加密，代码混淆，WebView/Js调用，https
    UI– 动画
    其他 – JNI，AIDL，Handler，Intent等
    开源框架 – Volley，Gilde，RxJava等（简历上写你会的，用过的）

#### 14、进程间通信的方式
#### 15、Dalvik虚拟机与java虚拟机的区别
#### 16、开源框架，为什么使用，与别的有什么区别
#### 17、android 内存优化
Android内存优化（使用SparseArray和ArrayMap代替HashMap）


## 网络部分
#### 1、http 和 https 的区别
#### 2、TCP与UDP区别
