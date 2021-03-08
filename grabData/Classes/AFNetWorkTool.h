//
//  AFNetWorkTool.h
//  TestStation
//
//  Created by xx on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFNetWorkTool : NSObject
/**
 *

 */
+(void)POST:(NSString *)URLStr parameters:(NSDictionary *)parameters head:(NSDictionary *)head callBackBlock:(void (^)(BOOL success ,NSURLSessionDataTask *task, id responseObject, NSError *error))callBackBlock;
@end

NS_ASSUME_NONNULL_END
