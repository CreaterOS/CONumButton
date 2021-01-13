//
//  CONumButtonVerdictFactory.m
//  conumButton
//
//  Created by Bryant Reyn on 2021/1/12.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import "CONumButtonVerdictFactory.h"

@implementation CONumButtonVerdictFactory

#pragma mark - 执行判断
+ (void)executeVerdict:(id)dataSource aSelector:(SEL)aSelector functionBlock:(void (^)(void))functionBlock{
    if ([dataSource respondsToSelector:aSelector]) {
        if (functionBlock != NULL) {
            functionBlock();
        }
    }
}

@end
