//
//  ViewController.m
//  TestStation
//
//  Created by 胡翔 on 2021/3/1.
//

#import "ViewController.h"
#import "AppRequestTool.h"
#import "UUIDTool.h"
#import "MD5.h"
#import "AFNetworking.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSThread currentThread].threadDictionary setObject:@"232c6fdc2826f7b77c28a23d7cb11fbd" forKey:@"ak"];
    
    
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.frame = CGRectMake(20, 100, 100, 35.0);
    [b setTitle:@"心跳接口" forState:UIControlStateNormal];
    [b setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(heartbeat:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    b1.frame = CGRectMake(20, 200, 100, 35.0);
    [b1 setTitle:@"实名制接口" forState:UIControlStateNormal];
    [b1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(userRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b1];

    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeCustom];
    b2.frame = CGRectMake(20, 300, 120, 35.0);
    [b2 setTitle:@"推送数据接口" forState:UIControlStateNormal];
    [b2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(pushData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b2];
    
    
}








- (void)heartbeat:(UIButton *)b {



  
 
    
    NSMutableDictionary *com =  @{
                           @"origin_id":@"1114"
                                  }.mutableCopy;
    
    
    [AppRequestTool heartbeat:@"https://devscrm.grazy.cn/open/heartbeat" comParam:com finished:^(id  _Nonnull result) {
        if (result) { 
            NSLog(@"%@",result);
        }
    }];
}






- (void)userRegister:(UIButton *)b {
    
    
    
//    NSString *interfaceName = @"https://devscrm.grazy.cn/open/push";
    
    NSString *distinct_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"distinct_id"];
    if (!distinct_id) {
        NSLog(@"先调心跳接口，获取distinct_id");
        return;
    }

   NSMutableDictionary *param = @{
                           @"ak":@"232c6fdc2826f7b77c28a23d7cb11fbd",
                           @"com":
                                   @{
                                     @"origin_id":@"1113",
                                     @"distinct_id":distinct_id
                                   },
                           @"pl":@"ios",
                          
              
    }.mutableCopy;
    NSMutableDictionary *com = @{
        @"origin_id":@"1113",
        @"distinct_id":distinct_id
    }.mutableCopy;
    NSMutableDictionary *usr = @{
        @"origin_id": @"1113",
           @"nickname": @"test",
           @"gender": @"男",
           @"phone": @(15867367321),
           @"country": @"中国",
           @"province": @"湖南",
           @"city": @"长沙",
           @"register_time": @(1608566401),
           @"register_source": @"js",
           @"register_source_platform": @"crm"
    }.mutableCopy;
    [param setObject:usr forKey:@"usr"];
    

    [AppRequestTool userRegister:@"https://devscrm.grazy.cn/open/register" comParam:com andUsrParam:usr finished:^(id  _Nonnull result) {
        if (result) {
            NSLog(@"%@",result);
        }
    }];
    
    
}


- (void)pushData:(UIButton *)b {
    
    NSString *distinct_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"distinct_id"];
    if (!distinct_id) {
        NSLog(@"先调心跳接口，获取distinct_id");
        return;
    }
    NSMutableDictionary *com = @{
            @"origin_id": @"1113",
            @"channel": @"渠道",
//            "ip_addr": "114.114.114.114",
//            @"event_time": @(1609046101),
            @"event_duration": @(1),
//            "event_start_time": 1609046101,
//            "imei" : "李望设备编号",
            @"oems" :@"设备制造商",
//            "app_version" : "APP版本",
            @"sdk_type": @"SDK类型",
            @"sdk_version": @"SDK版本",
//            "title" :"页面标题",
//            "share_id": "用户分享时的ID",
            @"url" :@"https://www.baidu.com?aa=as&utm_source=111",
//            "referrer": "https://packagist.org/packages/itbdw/ip-database?aa=11",
//            "is_resume_from_background" : false,
//            "is_first_visit" :false,
//            "is_login_id": false,
//            "is_wifi" :false,
//            "os_version" : "系统版本",
//            "browser" :"浏览器名",
//            "browser_version" : "浏览器版本"
    }.mutableCopy;
    
    
   
    NSString *event = @"BUSINESS_EVENT_event_buy_course_finish";
    
    
    NSMutableDictionary *pr = @{
         @"is_vip": [NSNumber numberWithBool:YES],
            @"platform_type": @"平台类型",
            @"product_name": @"产品名称",
            @"user_type": @"用户角色",
            @"vip_type": @"会员类型",
            @"course_name": @"课程名称",
            @"course_price": @(11.22),
            @"finish_time": @(1609046101),
            @"sum_payable": @(10.1),
            @"payment_duration": @(1)
    }.mutableCopy;

    
    [AppRequestTool Push:@"https://devscrm.grazy.cn/open/push" comParam:com andUsrPr:pr andEvent:event finished:^(id  _Nonnull result) {
        if (result) {
            NSLog(@"%@",result);
        }
    }];
    
    
}





//- (void)originRequest {
//    // 1.创建请求
//        NSURL *url = [NSURL URLWithString:@"https://devscrm.grazy.cn/open/heartbeat"];
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//        request.HTTPMethod = @"POST";
//
//       // 2.设置请求头
//    [request setValue:@"application/vnd.scrm.v1+json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"7bea2562e0551cc89c0f99da8efe5a8f" forHTTPHeaderField:@"sign"];
//
//    NSDictionary *json = @{@"ak":@"232c6fdc2826f7b77c28a23d7cb11fbd",@"com":@{@"imei":@"aaaa",@"origin_id":@"1113"},@"pl":@"js",@"time":@(1614675329)};
//
//
//    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
//        request.HTTPBody = data;
//
//        // 4.发送请求
//
//
//        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
//            NSString *newS = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",newS);
//
//        }];
//
//    return;
//}
@end
