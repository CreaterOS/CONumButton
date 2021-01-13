//
//  ViewController.m
//  conumButton
//
//  Created by Bryant Reyn on 2021/1/9.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import "ViewController.h"
#import "CONumButton.h"

@interface ViewController () <CONumButtonDelegate,CONumButtonDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CONumButton *numBT = [[CONumButton alloc] initWithCornerRadius:20 borderColor:[UIColor blackColor] borderWidth:1.0f leftTitle:@"-" rightTitle:@"+"];
//    numBT.frame = CGRectMake(50, 100, CO_BUTTON_WIDTH, CO_BUTTON_HEIGHT);
    CONumButton *numBT = [[CONumButton alloc] initWithFrame:CGRectMake(50, 100, CO_BUTTON_WIDTH, CO_BUTTON_HEIGHT) cornerRadius:20 borderColor:[UIColor blackColor] borderWidth:1.0f leftTitle:@"-" rightTitle:@"+"];
    numBT.delegate = self;
    numBT.dataSource = self;
    [self.view addSubview:numBT];
    
    [numBT reloadUI];
}

#pragma mark - CONumButtonDelegate,CONumButtonDataSource
- (void)clickCONumButton:(OptButton *)button numLabel:(UILabel *)numLabel{
    NSLog(@"%s",__func__);
    NSLog(@"tagName: %@, numLabel: %@",button.tagName,numLabel.text);
}

- (CGFloat)CONumButton:(CONumButton *)coNumButton width:(CGFloat)width{
    NSLog(@"%s",__func__);
    return 150;
}

- (CGFloat)CONumButton:(CONumButton *)coNumButton height:(CGFloat)height{
    NSLog(@"%s",__func__);
    return 44;
}

- (CGFloat)CONumButton:(CONumButton *)coNumButton widthOfLable:(CGFloat)width{
    NSLog(@"%s",__func__);
    return 70;
}

- (UIColor *)CONumButton:(CONumButton *)coNumButton borderColor:(UIColor *)borderColor{
    NSLog(@"%s",__func__);
    return [UIColor systemGray3Color];
}

- (UIColor *)CONumButton:(CONumButton *)coNumButton numLabelBorderColor:(UIColor *)borderColor{
    NSLog(@"%s",__func__);
    return [UIColor systemGray3Color];
}

- (UIColor *)CONumButton:(CONumButton *)button subFontColor:(UIColor *)fontColor{
    NSLog(@"%s",__func__);
    return [UIColor systemOrangeColor];
}

- (UIColor *)CONumButton:(CONumButton *)button addFontColor:(UIColor *)fontColor{
    NSLog(@"%s",__func__);
    return [UIColor systemPurpleColor];
}

- (UIColor *)CONumButton:(CONumButton *)button numLabelFontColor:(UIColor *)fontColor{
    NSLog(@"%s",__func__);
    return [UIColor systemYellowColor];
}

- (NSUInteger)CONumButton:(CONumButton *)button numLabelFontSize:(NSUInteger)fontSize{
    NSLog(@"%s",__func__);
    return 30;
}

- (CGFloat)CONumButton:(CONumButton *)button borderWidth:(CGFloat)borderWidth{
    NSLog(@"%s",__func__);
    return 1;
}

- (CGFloat)CONumButton:(CONumButton *)button numLabelBorderWidth:(CGFloat)numLabelBorderWidth{
    NSLog(@"%s",__func__);
    return 1;
}

@end
