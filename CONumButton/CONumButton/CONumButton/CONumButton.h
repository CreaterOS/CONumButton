//
//  CONumButton.h
//  CONumButton
//
//  Created by Bryant Reyn on 2021/1/9.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CO_BUTTON_WIDTH 120
#define CO_BUTTON_HEIGHT 40

/// 操作按钮
@interface OptButton : UIButton
@property (nonatomic,copy)NSString * _Nonnull tagName; //标识名称
@end

@class CONumButton;

NS_ASSUME_NONNULL_BEGIN

/// 计数标签
@interface NumLabel : UILabel
@end

/// CONumButtonDelegate
@protocol CONumButtonDelegate <NSObject>

@optional
- (void)clickCONumButton:(OptButton *__nonnull)button numLabel:(UILabel *__nonnull)numLabel;

@end

/// CONumButtonDataSource
@protocol CONumButtonDataSource <NSObject>

@required

/// 修改计数标签宽度
/// @param coNumButton self
/// @param width 默认宽度
- (CGFloat)CONumButton:(CONumButton *__nonnull)coNumButton widthOfLable:(CGFloat)width;

/// 修改整个视图的宽度
/// @param coNumButton self
/// @param width 默认宽度
- (CGFloat)CONumButton:(CONumButton *__nonnull)coNumButton width:(CGFloat)width;

/// 修改整个视图的高度
/// @param coNumButton self
/// @param height 默认高度
- (CGFloat)CONumButton:(CONumButton *__nonnull)coNumButton height:(CGFloat)height;

/// 修改边框颜色
/// @param coNumButton self
/// @param borderColor 边框颜色
- (UIColor *)CONumButton:(CONumButton *__nonnull)coNumButton borderColor:(UIColor *)borderColor;

/// 修改计数边框颜色
/// @param coNumButton self
/// @param borderColor 计数边框颜色
- (UIColor *)CONumButton:(CONumButton *__nonnull)coNumButton numLabelBorderColor:(UIColor *)borderColor;

/// 修改减按钮字体颜色
/// @param button self
/// @param fontColor 字体颜色
- (UIColor *)CONumButton:(CONumButton *__nonnull)button subFontColor:(UIColor *)fontColor;

/// 修改加按钮字体颜色
/// @param button self
/// @param fontColor 字体颜色
- (UIColor *)CONumButton:(CONumButton *__nonnull)button addFontColor:(UIColor *)fontColor;

/// 修改计数标签字体颜色
/// @param button self
/// @param fontColor 字体颜色
- (UIColor *)CONumButton:(CONumButton *__nonnull)button numLabelFontColor:(UIColor *)fontColor;

/// 修改计数标签字体大小
/// @param button self
/// @param fontSize 字体颜色
- (NSUInteger)CONumButton:(CONumButton *__nonnull)button numLabelFontSize:(NSUInteger)fontSize;

/// 修改边框宽度
/// @param button self
/// @param borderWidth 边框宽度
- (CGFloat)CONumButton:(CONumButton *__nonnull)button borderWidth:(CGFloat)borderWidth;

/// 修改计数标签边框宽度
/// @param button self
/// @param numLabelBorderWidth 边框宽度
- (CGFloat)CONumButton:(CONumButton *__nonnull)button numLabelBorderWidth:(CGFloat)numLabelBorderWidth;

@end

@interface CONumButton : UIView
@property (nonatomic,weak,nullable)id<CONumButtonDataSource> dataSource;
@property (nonatomic,weak,nullable)id<CONumButtonDelegate> delegate;

/// 初始化
/// @param cornerRadius 圆角
/// @param borderColor 边框颜色
/// @param borderWidth 边框宽度
/// @param leftTitle 左标题
/// @param rightTitle 右标题
- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

/// 初始化
/// @param frame 设置位置
/// @param cornerRadius 圆角
/// @param borderColor 边框颜色
/// @param borderWidth 边框宽度
/// @param leftTitle 左标题
/// @param rightTitle 右标题
- (instancetype)initWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

/// 重新加载UI
- (void)reloadUI;

@end

NS_ASSUME_NONNULL_END
