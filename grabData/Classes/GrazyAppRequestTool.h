//
//  AppRequestTool.h
//  TestStation
//
//  Created by hx on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "AFNetWorkTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface GrazyAppRequestTool : NSObject
/**
 
 */
+(void)heartbeatWithcomParam:(NSMutableDictionary *)com finished:(void (^)(NSDictionary *result))block;
+(void)userRegisterWithcomParam:(NSMutableDictionary *)com andUsrParam:(NSMutableDictionary *)usr finished:(void (^)(NSDictionary *result))block;
+(void)PushWithcomParam:(NSMutableDictionary *)com andUsrPr:(NSMutableDictionary *)pr andMod:(NSMutableDictionary *)mod andEvent:(NSString *)event finished:(void (^)(NSDictionary *result))block;
@end

NS_ASSUME_NONNULL_END
