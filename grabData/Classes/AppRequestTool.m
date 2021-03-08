//
//  AppRequestTool.m
//  TestStation
//
//  Created by hx on 2021/3/1.
//

#import "AppRequestTool.h"
#import "UUIDTool.h"
#import "MD5.h"


@implementation AppRequestTool
+(void)heartbeat:(NSString *)URLString comParam:(NSMutableDictionary *)com finished:(void (^)(NSDictionary *result))block{
    
    NSNumber *time = [NSNumber numberWithLong:(long)[[NSDate date] timeIntervalSince1970]];
    
   NSString *ak = [[NSThread currentThread].threadDictionary objectForKey:@"ak"];
    NSString *pl = @"ios";

        [com setObject:@"111" forKey:@"imei"]; // 设备编号

    NSMutableDictionary *param = @{
        @"ak":ak,
        @"pl":pl,
        @"time":time,
        @"com":com
        
         
    }.mutableCopy;
     
    
       NSString *pr_str_md5 = [MD5 md532BitLower:[AppRequestTool stringWithDict:com]];
    
    NSString *key_str_md5 = [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@%@",ak,pl,time]];

    NSString *validator_sign =  [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@",key_str_md5,pr_str_md5]];

    NSLog(@"%@",param);
    NSDictionary *head = @{
        @"Accept":@"application/vnd.scrm.v1+json",
        @"Content-Type":@"application/json",
        @"sign":validator_sign
    };
    
    
    
    
    
    
    [AFNetWorkTool POST:URLString parameters:param head:head callBackBlock:^(BOOL success, NSURLSessionDataTask *task, id responseObject, NSError *error) {
        
        [AppRequestTool handleAjaxResult:success task:task data:responseObject error:error finished:block];
    }];
}

+(void)userRegister:(NSString *)URLString comParam:(NSMutableDictionary *)com andUsrParam:(NSMutableDictionary *)usr finished:(void (^)(NSDictionary *result))block{
    
    NSNumber *time = [NSNumber numberWithLong:(long)[[NSDate date] timeIntervalSince1970]];
    
   NSString *ak = [[NSThread currentThread].threadDictionary objectForKey:@"ak"];
    NSString *pl = @"ios";

        [com setObject:@"111" forKey:@"imei"]; // 设备编号

    
    
    
    
    
    NSString *distinct_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"distinct_id"];
    if (distinct_id) {
        distinct_id = @"111";
        [com setObject:distinct_id forKey:@"distinct_id"];
    } else {
        return;
    }

    
    if (!usr) {
        usr = [NSMutableDictionary dictionary];
    }
        
        
//        [usr setObject:@"ios" forKey:@"register_source"];
        [usr setObject:time forKey:@"register_time"];
  
    NSMutableDictionary *param = @{
        @"ak":ak,
        @"pl":pl,
        @"time":time,
        @"com":com,
        @"usr":usr
         
    }.mutableCopy;
     
    NSString *m = [AppRequestTool stringWithDict:usr];
       NSString *sort_data = [MD5 md532BitLower:[AppRequestTool stringWithDict:usr]];
    
    
    NSString *com_sort_data = [MD5 md532BitLower:[AppRequestTool stringWithDict:com]];

        // 用户属性
    
        
    NSString *pr_str_md5 = [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@",sort_data,com_sort_data]];
        
    NSString *key_str_md5 = [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@%@",ak,pl,time]];

    NSString *validator_sign =  [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@",key_str_md5,pr_str_md5]];

    NSLog(@"%@",param);
    NSDictionary *head = @{
        @"Accept":@"application/vnd.scrm.v1+json",
        @"Content-Type":@"application/json",
        @"sign":validator_sign
    };
    
    
    
    
    
    
    [AFNetWorkTool POST:URLString parameters:param head:head callBackBlock:^(BOOL success, NSURLSessionDataTask *task, id responseObject, NSError *error) {
        
        [AppRequestTool handleAjaxResult:success task:task data:responseObject error:error finished:block];
    }];
}

+(void)Push:(NSString *)URLString comParam:(NSMutableDictionary *)com andUsrPr:(NSMutableDictionary *)pr andEvent:(NSString *)event finished:(void (^)(NSDictionary *result))block{
    
    NSNumber *time = [NSNumber numberWithLong:(long)[[NSDate date] timeIntervalSince1970]];
    
   NSString *ak = [[NSThread currentThread].threadDictionary objectForKey:@"ak"];
    NSString *pl = @"ios";
    
    
    
    
    
//    [com setObject:[UUIDTool getUUIDInKeychain] forKey:@"imei"]; // 设备编号
        [com setObject:@"111" forKey:@"imei"]; // 设备编号

    /*
    [com setObject:time forKey:@"event_time"]; // 事件写入时间
    [com setObject:@(1) forKey:@"event_duration"]; // 事件时长
    [com setObject:time forKey:@"event_start_time"]; // 事件触发时间
    [com setObject:@"SDK类型" forKey:@"sdk_type"]; // SDK类型
    [com setObject:@"SDK版本" forKey:@"sdk_version"]; // SDK版本
    [com setObject:@"https://www.baidu.com?aa=as&utm_source=111" forKey:@"url"]; // 页面地址
     */
    //
    
    
    
    
    
    
    NSString *distinct_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"distinct_id"];
    if (distinct_id) {
        [com setObject:distinct_id forKey:@"distinct_id"];
    } else {
        NSLog(@"distinct_id没有");
        return;
    }
    NSString *session_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_id"];
    if (session_id) {
        [com setObject:session_id forKey:@"session_id"];
    } else {
        NSLog(@"session_id没有");
        return;
    }
    
    
    if (!pr) {
        pr = [NSMutableDictionary dictionary];
    }
        
        
//        [usr setObject:@"ios" forKey:@"register_source"];
        
  
    NSMutableDictionary *param = @{
        @"ak":ak,
        @"pl":pl,
        @"time":time,
        @"event":event,
        @"com":com,
        @"pr":pr
        
    }.mutableCopy;
   
   
    
       NSString *pr_sort_data = [MD5 md532BitLower:[AppRequestTool stringWithDict:pr]];

    
    NSString *com_sort_data = [MD5 md532BitLower:[AppRequestTool stringWithDict:com]];

        // 用户属性
    
        
    NSString *pr_str_md5 = [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@",pr_sort_data,com_sort_data]];
        
    NSString *key_str_md5 = [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@%@%@",ak,pl,event,time]];

    NSString *validator_sign =  [MD5 md532BitLower:[NSString stringWithFormat:@"%@%@",key_str_md5,pr_str_md5]];

    NSLog(@"%@",param);
    NSDictionary *head = @{
        @"Accept":@"application/vnd.scrm.v1+json",
        @"Content-Type":@"application/json",
        @"sign":validator_sign
    };
    
    
    
    
    
    
    [AFNetWorkTool POST:URLString parameters:param head:head callBackBlock:^(BOOL success, NSURLSessionDataTask *task, id responseObject, NSError *error) {
        
        [AppRequestTool handleAjaxResult:success task:task data:responseObject error:error finished:block];
    }];
}


+(void)handleAjaxResult:(BOOL)success task:(NSURLSessionDataTask *)task data:(id)responseObject error:(NSError *)error finished:(void (^)(NSDictionary *result))block{
    //    NSString *receiveStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",receiveStr);
    
    
    //
    if (error) {
        NSLog(@"%@",error.description);
    }
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *result = responseObject;
           
                if (result[@"data"]) {
                    if ([result[@"data"] isKindOfClass:[NSDictionary class]]) {
                        NSDictionary *data = result[@"data"];
                        if (data[@"distinct_id"]) {
                            NSString *distinct_id = data[@"distinct_id"];
                            [[NSUserDefaults standardUserDefaults] setValue:distinct_id forKey:@"distinct_id"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                        if (data[@"session_id"]) {
                            NSString *session_id = data[@"session_id"];
                            [[NSUserDefaults standardUserDefaults] setValue:session_id forKey:@"session_id"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                    }
                    
                    
                    
                }
        }
 
    block(responseObject);
}
+(NSString*)stringWithDict:(NSDictionary*)dict{
    
    NSArray*keys = [dict allKeys];
    
    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
        return[obj1 compare:obj2 options:NSNumericSearch];//正序
    }];
    
    NSString*str =@"";
    
    for(NSString*categoryId in sortedArray) {
        
        id value = [dict objectForKey:categoryId];
        
        if([value isKindOfClass:[NSDictionary class]]) {
            
            value = [self stringWithDict:value];
            
        }
        
        if([str length] !=0) {
            
            str = [str stringByAppendingString:@","];
            
        }
        if ([value isKindOfClass:[NSNumber class]]) {
            // bool 类型要做特别处理
            if ([categoryId isEqualToString:@"is_vip"]) {
                int a = [value intValue];
                if (a == 1) {
                    str = [str stringByAppendingFormat:@"\"%@\":true",categoryId];
                } else {
                    str = [str stringByAppendingFormat:@"\"%@\":false",categoryId];
                }

            } else {
               str = [str stringByAppendingFormat:@"\"%@\":%@",categoryId,value];
            }
            
        } else {
            str = [str stringByAppendingFormat:@"\"%@\":\"%@\"",categoryId,value];
        }
        
    }
    
    
    str = [NSString stringWithFormat:@"{%@}",str];
    
    return str;
}
@end
