//
//  CORuntime.h
//  CONumButton
//
//  Created by mac on 2021/1/15.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface CORuntime : NSObject

/// 获得协议方法
/// @param obj 代理对象
+ (NSMutableArray *)getMethodForDataSource:(id)obj;

/// 获得协议方法
/// @param obj 代理对象
/// @param keywords 关键词
+ (NSMutableArray *)getMethodForDataSource:(id)obj keywords:(NSString *__nonnull)keywords;
@end

NS_ASSUME_NONNULL_END
