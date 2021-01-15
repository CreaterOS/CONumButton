//
//  CORuntime.m
//  CONumButton
//
//  Created by mac on 2021/1/15.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import "CORuntime.h"

@implementation CORuntime

#pragma mark - 获得方法
+ (NSMutableArray *)getMethodForDataSource:(id)obj{
    NSMutableArray *aSelectDataSourceArr = [NSMutableArray array];
    
    unsigned int count;
    Method *methods = class_copyMethodList([obj class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methods[i];
        NSString *selStr = NSStringFromSelector(method_getName(method));
        [aSelectDataSourceArr addObject:selStr];
    }
    free(methods);
    
    return aSelectDataSourceArr;
}

+ (NSMutableArray *)getMethodForDataSource:(id)obj keywords:(NSString *__nonnull)keywords{
    NSMutableArray *aSelectDataSourceArr = [NSMutableArray array];
    
    unsigned int count;
    Method *methods = class_copyMethodList([obj class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methods[i];
        NSString *selStr = NSStringFromSelector(method_getName(method));
        if ([selStr length] != 0 && [selStr containsString:keywords] && [selStr characterAtIndex:0] == [keywords characterAtIndex:0]) {
            [aSelectDataSourceArr addObject:selStr];
        }
    }
    free(methods);
    
    return aSelectDataSourceArr;
}
@end
