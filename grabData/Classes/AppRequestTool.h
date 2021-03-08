//
//  AppRequestTool.h
//  TestStation
//
//  Created by hx on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "AFNetWorkTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppRequestTool : NSObject
/**
 
 */
+(void)heartbeat:(NSString *)URLString comParam:(NSMutableDictionary *)com finished:(void (^)(NSDictionary *result))block;
+(void)userRegister:(NSString *)URLString comParam:(NSMutableDictionary *)com andUsrParam:(NSMutableDictionary *)usr finished:(void (^)(NSDictionary *result))block;
+(void)Push:(NSString *)URLString comParam:(NSMutableDictionary *)com andUsrPr:(NSMutableDictionary *)pr andEvent:(NSString *)event finished:(void (^)(NSDictionary *result))block;
@end

NS_ASSUME_NONNULL_END
