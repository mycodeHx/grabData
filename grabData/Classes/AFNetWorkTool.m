//
//  AFNetWorkTool.m
//  TestStation
//
//  Created by hx on 2021/3/1.
//

#import "AFNetWorkTool.h"

@implementation AFNetWorkTool
+(AFHTTPSessionManager *)shareAFNManager {
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}
+ (NSDictionary *)getheadParam {
    NSLog(@"");

    
    return @{};
   
}
+(void)POST:(NSString *)URLStr parameters:(NSDictionary *)parameters head:(NSDictionary *)head callBackBlock:(void (^)(BOOL success ,NSURLSessionDataTask *task, id responseObject, NSError *error))callBackBlock{
    
    
    AFHTTPSessionManager *manager = [AFNetWorkTool shareAFNManager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    
    
    NSLog(@"%@",parameters);
    NSLog(@"%@",head);
    
    
        [manager POST:URLStr parameters:parameters headers:head progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           callBackBlock(YES,task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBackBlock(NO,task,nil,error);
    }];
    
    
}
@end
