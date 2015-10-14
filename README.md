# BackgroundLocation


## iOS真后台和服务

iOS从诞生到现在对应用的后台运行一直有所限制，了解苹果产品的朋友应该都明白，这正是苹果为了提高用户体验而做的取舍，为了手机的资源更合理的利用，而不是被后台运行的“卡死”或者手机电量无辜消耗。

既然传说中4.0之前的时代都有推送，那么4.0之后肯定也是要支持的。消息推送可是把客户端和服务器紧密结合起来满足商业需求的重要利器。除了消息推送通知，iOS也有对应的本地通知。

实际上，除了消息以外，苹果的iOS对特定的服务也是支持真后台运行的。主要包括：

1：音乐播放和录制；
2：定位服务，iOS的定位服务分为显著位置变化检测和高精确度的定位，后者是支持后台定位跟踪的；
3：VoIP；
4：蓝牙及外部设备通信；
当然，真后台的服务也不止这些，更详细的可以参看这里：
[Background Execution](https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html)




## 基于定位的后台运行Demo
大多数后台模式（有限时长任务除外），都需要在info.plist中添加一个key，来声明该app在后台时要运行代码。当然使用定位后台模式也是需要的，添加key的方式有以下三种，如图

![直接在info.plist文件里面添加](https://raw.githubusercontent.com/yz--lmy/BackgroundLocation/master/BackgroundLocation/IMG/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202015-10-13%20%E4%B8%8B%E5%8D%885.18.35.png)
主要步骤：1，点击项目；2，点击info.plist；3，点击“+”； 4，在出现的列表中，选择‘Required Background Modes’；
选择后Xcode将会在该条目下创建一个数组，并含有一个空条目。点击该子条目右侧，并选择‘App registers for location updates’。在显示的列表中，还有其他的后台模式，当然也包含一些基于某些硬件的条目信息。

![通过点击目标程序的Capabilities(功能)选项卡方式添加](https://raw.githubusercontent.com/yz--lmy/BackgroundLocation/master/BackgroundLocation/IMG/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202015-10-13%20%E4%B8%8B%E5%8D%885.18.23.png)
通过点击目标程序的Capabilities(功能)选项卡方式添加，这种添加方式实际上是直接往info.plist添加key的一种快捷方法，效果是一样的，这一点通过如图中Steps后面的那段提示语可以看出。



![把info.plist文件以xml源码的形式打开添加](https://raw.githubusercontent.com/yz--lmy/BackgroundLocation/master/BackgroundLocation/IMG/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202015-10-13%20%E4%B8%8B%E5%8D%885.18.54.png)
由于info.plist文件实质是一段xml格式的文本，因此也可以以xml源码的方式直接添加键值，首先要以源码方式打开info.plist文件，打开方式如图。

打开后添加键值
```xml
 <key>UIBackgroundModes</key>
	<array>
		<string>location</string>
	</array>
```	
如下图：
![info.plist文件xml源码](https://raw.githubusercontent.com/yz--lmy/BackgroundLocation/master/BackgroundLocation/IMG/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202015-10-13%20%E4%B8%8B%E5%8D%885.19.26.png)

这三种方式实际效果是一样的，只不过方式不同而已。

