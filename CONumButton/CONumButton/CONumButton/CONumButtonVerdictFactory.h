//
//  CONumButtonVerdictFactory.h
//  conumButton
//
//  Created by Bryant Reyn on 2021/1/12.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

/**
 * 策略模式 + 工厂模式
 *  method + function
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CONumButtonVerdictFactory : NSObject

/// 执行判断
+ (void)executeVerdict:(id)dataSource aSelector:(SEL)aSelector functionBlock:(void (^)(void))functionBlock;

@end

NS_ASSUME_NONNULL_END
