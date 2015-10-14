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
大多数后台模式（有限时长任务除外），都需要在info.plist中添加一个key，来声明该app在后台时要运行代码。当然使用定位后台模式也是需要的，
