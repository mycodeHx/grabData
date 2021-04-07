# grabData

[![CI Status](https://img.shields.io/travis/641559096@qq.com/grabData.svg?style=flat)](https://travis-ci.org/641559096@qq.com/grabData)
[![Version](https://img.shields.io/cocoapods/v/grabData.svg?style=flat)](https://cocoapods.org/pods/grabData)
[![License](https://img.shields.io/cocoapods/l/grabData.svg?style=flat)](https://cocoapods.org/pods/grabData)
[![Platform](https://img.shields.io/cocoapods/p/grabData.svg?style=flat)](https://cocoapods.org/pods/grabData)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

为了能够将项目运行起来，你先运行 pod install 命令

## Requirements

## Installation (安装)

grabData is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

在podfile 文件中加入 以下文件

```ruby
pod 'grabData'
```

## Author(作者)

641559096@qq.com, 



Demo详情请见 Example
## License

grabData is available under the MIT license. See the LICENSE file for more info.



###代码调用示例



##接口调用文档

// 初始化数据
 [[NSThread currentThread].threadDictionary setObject:@"商家编码" forKey:@"ak"];

 [[NSThread currentThread].threadDictionary setObject:@"平台类型" forKey:@"pl"]; // 







### 推送实名制数据

  NSMutableDictionary *com = @{

​    @"origin_id":@"商机用户ID",

​    @"imei":@"设备唯一编码"

  }.mutableCopy;

  NSMutableDictionary *usr = @{

​    @"时间属性key1" : @"事件属性value1",

​        @"时间属性key1" : @"事件属性value1",

  }.mutableCopy;



  [AppRequestTool userRegisterWithcomParam:com andUsrParam:usr finished:^(**id** **_Nonnull** result) { }];



### 推送埋点数据

  NSMutableDictionary *com = @{

​    @"origin_id":@"商机用户ID",

​    @"imei":@"设备唯一编码"

  }.mutableCopy;

  NSMutableDictionary *pr = @{

​    @"时间属性key1" : @"事件属性value1",

​        @"时间属性key1" : @"事件属性value1",

  }.mutableCopy;

  NSString *event = @"事件编码";

[AppRequestTool PushWithcomParam:com andUsrPr:pr andEvent:event finished:^(**id** **_Nonnull** result) { }];

