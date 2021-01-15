//
//  CONumButton.m
//  CONumButton
//
//  Created by Bryant Reyn on 2021/1/9.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import "CONumButton.h"
#import "CONumButtonVerdictFactory.h"
#import "CORuntime.h"

#define TAG_NAME_FIRST @"CONum_"

#define CO_BUTTON_BORDER_COLOR [UIColor blackColor]
#define CO_NUM_LABEL_BORDER_COLOR [UIColor blackColor]
#define CO_SUB_BUTTON_COLOR [UIColor blackColor]
#define CO_ADD_BUTTON_COLOR [UIColor blackColor]
#define CO_NUM_LABEL_COLOR [UIColor blackColor]

#define WEAK_SELF(self) __weak typeof(self) weakself = self;
#define STRONG_SELF(weakself) __strong typeof(weakself) self = weakself;

#pragma mark - 操作按钮
@implementation OptButton

#pragma mark - 初始化
- (instancetype)initWithOptTitle:(NSString *__nonnull)optTitle optColor:(UIColor *__nullable)optColor{
    if (self = [super init]) {
        /* 设置标题 */
        [self setTitle:optTitle forState:UIControlStateNormal];
        /* 设置颜色 */
        if (optColor == nil) optColor = CO_SUB_BUTTON_COLOR;
        [self setTitleColor:optColor forState:UIControlStateNormal];
    }
    
    return self;
}

@end

#pragma mark - 计数标签
@implementation NumLabel

#pragma mark - 初始化
- (instancetype)init{
    if (self = [super init]) {
        self.layer.borderColor = CO_NUM_LABEL_BORDER_COLOR.CGColor;
        self.layer.borderWidth = 1.0f;
        self.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

@end

@interface CONumButton()
@property (nonatomic,strong)OptButton *subButton; // 减法按钮
@property (nonatomic,strong)OptButton *addButton; // 加法按钮
@property (nonatomic,strong)NumLabel *numLabel; // 计数标签

@property (nonatomic,strong)NSMutableArray *aSelectArr; // 选择字典
@end

@implementation CONumButton
#pragma mark - 懒加载
- (NSMutableArray *)aSelectArr{
    if (!_aSelectArr) {
        _aSelectArr = [CORuntime getMethodForDataSource:self.dataSource keywords:@"CONumButton"];
    }
    
    return _aSelectArr;
}

#pragma mark - 初始化
- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle{
    if (self = [super init]) {
        self.layer.cornerRadius = cornerRadius;
        self.layer.borderColor = borderColor.CGColor;
        self.layer.borderWidth = borderWidth;
        self.layer.masksToBounds = YES;
        
        [self setUp:leftTitle rightTitle:rightTitle];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = cornerRadius;
        self.layer.borderColor = borderColor.CGColor;
        self.layer.borderWidth = borderWidth;
        self.layer.masksToBounds = YES;
        [self setUp:leftTitle rightTitle:rightTitle];
    }
    return self;
}

- (void)setUp:(NSString *)leftTitle rightTitle:(NSString *)rightTitle{
    CGFloat numL_W = self.frame.size.width * 0.5;
    CGFloat opt_W = (self.frame.size.width - numL_W) * 0.5;
    CGFloat height = self.frame.size.height;
    
    // 减号
    OptButton *subButton = [[OptButton alloc] initWithOptTitle:leftTitle optColor:CO_SUB_BUTTON_COLOR];
    subButton.tagName = [TAG_NAME_FIRST stringByAppendingString:@"Sub"];
    subButton.frame = CGRectMake(0, 0, opt_W, height);
    self.subButton = subButton;
    [self addSubview:subButton];
    
    // 添加显示个数的标签
    NumLabel *numLabel = [[NumLabel alloc] init];
    numLabel.frame = CGRectMake(opt_W, 0, numL_W, height);
    numLabel.text = @"1";
    self.numLabel = numLabel;
    [self addSubview:numLabel];
    
    // 加号
    OptButton *addButton = [[OptButton alloc] initWithOptTitle:rightTitle optColor:CO_ADD_BUTTON_COLOR];
    addButton.tagName = [TAG_NAME_FIRST stringByAppendingString:@"Add"];
    addButton.frame = CGRectMake(opt_W + numL_W, 0, opt_W, height);
    self.addButton = addButton;
    [self addSubview:addButton];
    
    [subButton addTarget:self action:@selector(opt:) forControlEvents:UIControlEventTouchDown];
    [addButton addTarget:self action:@selector(opt:) forControlEvents:UIControlEventTouchDown];
}

#pragma mark - 点击
- (void)opt:(OptButton *)button{
    if ([_delegate respondsToSelector:@selector(clickCONumButton:numLabel:)]) {
        /* 遵从协议 */
        [_delegate clickCONumButton:button numLabel:[self changeNumLabel:button]];
    }
}

/// 修改标签计数
/// @param button 操作按钮
- (NumLabel *__nonnull)changeNumLabel:(OptButton *)button{
    NSString *text = self.numLabel.text;
    NSUInteger num = (NSUInteger)text.integerValue;
    NSString *tagName = button.tagName;
    if ([tagName length] != 0 && [tagName isEqualToString:[TAG_NAME_FIRST stringByAppendingString:@"Sub"]]) {
        // 减法
        self.numLabel.text = [NSString stringWithFormat:@"%zd",(num-- > 1) ? num-- : 1];
    }else{
        // 加法
        self.numLabel.text = [NSString stringWithFormat:@"%zd",++num];
    }
    
    return self.numLabel;
}


#pragma mark - 重新加载UI
- (void)reloadUI{
    id<CONumButtonDataSource> dataSource = self.dataSource;
    NSMutableArray *aSelArr = self.aSelectArr;
    
    WEAK_SELF(self)
    NSArray *aSelBlockFunction = @[^{ /* 宽度 */
        STRONG_SELF(weakself)
        CGRect rect = self.frame;
        CGFloat width = [dataSource CONumButton:self width:CO_BUTTON_WIDTH];
        self.frame = CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
        
        /* 移除视图 */
        [self removeSuperView];
                
        [self setUp:@"-" rightTitle:@"+"];
    },^{ /* 高度 */
        STRONG_SELF(weakself)
        CGRect rect = self.frame;
        CGFloat height = [dataSource CONumButton:self height:CO_BUTTON_HEIGHT];
        self.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
        
        /* 移除视图 */
        [self removeSuperView];
                
        [self setUp:@"-" rightTitle:@"+"];
    },^{ /* 标签宽度 */
        STRONG_SELF(weakself)
        /* 设置默认的宽度 */
        CGFloat width = [dataSource CONumButton:self widthOfLable:self.numLabel.frame.size.width];
        /* 修改计数标签长度 */
        CGRect bounds = self.bounds;
        CGFloat frame_W = bounds.size.width;
        if (width >= frame_W-40 || width <= 0) {
            width = self.numLabel.frame.size.width;
        }
        /* 更新布局 */
        CGRect subFrame = self.subButton.frame;
        CGRect addFrame = self.addButton.frame;
        CGRect numLFrame = self.numLabel.frame;
       
        CGFloat button_W = (frame_W - width) * 0.5;
        self.subButton.frame = CGRectMake(subFrame.origin.x, subFrame.origin.y,  button_W, subFrame.size.height);
        self.addButton.frame = CGRectMake(button_W + width, addFrame.origin.y,   button_W, addFrame.size.height);
        self.numLabel.frame = CGRectMake(button_W, numLFrame.origin.y, width, numLFrame.size.height);
    },^{ /* 边框颜色 */
        STRONG_SELF(weakself)
        UIColor *borderColor = [dataSource CONumButton:self borderColor:CO_BUTTON_BORDER_COLOR];
        self.layer.borderColor = borderColor.CGColor;
    },^{ /* 计数标签边框颜色 */
        STRONG_SELF(weakself)
        UIColor *numLabelBorderColor = [dataSource CONumButton:self numLabelBorderColor:CO_NUM_LABEL_BORDER_COLOR];
        self.numLabel.layer.borderColor = numLabelBorderColor.CGColor;
    },^{ /* 操作按钮字体颜色 */
        STRONG_SELF(weakself)
        UIColor *fontColor = [dataSource CONumButton:self subFontColor:CO_SUB_BUTTON_COLOR];
        [self.subButton setTitleColor:fontColor forState:UIControlStateNormal];
    },^{
        STRONG_SELF(weakself)
        UIColor *fontColor = [dataSource CONumButton:self addFontColor:CO_ADD_BUTTON_COLOR];
        [self.addButton setTitleColor:fontColor forState:UIControlStateNormal];
    },^{ /* 计数标签字体颜色 */
        STRONG_SELF(weakself)
        UIColor *fontColor = [dataSource CONumButton:self numLabelFontColor:CO_NUM_LABEL_COLOR];
        self.numLabel.textColor = fontColor;
    },^{ /* 计数标签字体大小 */
        STRONG_SELF(weakself)
        NSUInteger fontSize = [dataSource CONumButton:self numLabelFontSize:0];
        [self.numLabel setFont:[UIFont systemFontOfSize:fontSize]];
    },^{ /* 边框宽度 */
        STRONG_SELF(weakself)
        CGFloat borderWidth = [dataSource CONumButton:self borderWidth:self.layer.borderWidth];
        self.layer.borderWidth = borderWidth;
    },^{ /* 计数标签边框宽度 */
        STRONG_SELF(weakself)
        CGFloat borderWidth = [dataSource CONumButton:self numLabelBorderWidth:self.numLabel.layer.borderWidth];
        self.numLabel.layer.borderWidth = borderWidth;
    }];
    
    // 遍历选择器字典
    NSUInteger len = [aSelArr count];
    for (NSUInteger i = 0; i < len; i++) {
        NSString *aSelectorName = self.aSelectArr[i];
        dispatch_block_t blockFunc = aSelBlockFunction[i];
        [CONumButtonVerdictFactory executeVerdict:self.dataSource aSelector:NSSelectorFromString(aSelectorName) functionBlock:blockFunc];
    }
}

#pragma mark - 移除视图
- (void)removeSuperView{
    for (UIView *view in self.subviews) [view removeFromSuperview];
}

@end
