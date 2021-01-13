## CONumButton

​	数字按钮是开发中常用的控件，CONumButton提供了数字按钮功能，能够实现个性化定制，点击Sub和Add按钮可以动态显示个数变化，CONumButton提供的SDK提供了delegate和dataSource进行处理。开发时，可根据自身需要自定义dataSource从而改变配置。

​	CONumButton是一个轻量级的UI框架，通过CONumButton类可以直接定义使用UI控件，它以更好的语法包装了UIButton和UILabel组合UI布局。CONumButton支持iOS。

​	请查看CONumButton提供的示例项目。

### 使用方法

#### 一. 添加CONumButton控件

​	通过初始化就可以配置UI控件的圆角，边缘颜色，边框宽度，左边标题，右边标题的值。

​	CONumButton提供了宏定义

- CO_BUTTON_WIDTH
- CO_BUTTON_HEIGHT

1. 利用CO_BUTTON_WIDTH和CO_BUTTON_HEIGHT定义frame

```objective-c
CONumButton *numBT = [[CONumButton alloc] initWithCornerRadius:20 borderColor:[UIColor blackColor] borderWidth:1.0f leftTitle:@"-" rightTitle:@"+"];
numBT.frame = CGRectMake(50, 100, CO_BUTTON_WIDTH, CO_BUTTON_HEIGHT);
[self.view addSubview:numBT];
```

2. 利用initWithFrame:cornerRadius:borderColor:borderWidth:leftTitle:rightTitle:进行初始化

```objective-c
CONumButton *numBT = [[CONumButton alloc] initWithFrame:CGRectMake(50, 100, CO_BUTTON_WIDTH, CO_BUTTON_HEIGHT) cornerRadius:20 borderColor:[UIColor blackColor] borderWidth:1.0f leftTitle:@"-" rightTitle:@"+"];
[self.view addSubview:numBT];
```

#### 二. CONumButton点击

​	当点击CONumButton按钮，进行操作可通过调用delegate的clickCONumButton:numLabel:方法进行操作

```objective-c
	numBT.delegate = self;
```

```objective-c
- (void)clickCONumButton:(OptButton *)button numLabel:(UILabel *)numLabel{
    NSLog(@"%s",__func__);
  	// 进行点击后的操作
}
```

#### 三. CONumButton属性修改

| 属性             | dataSource方法                   |
| ---------------- | -------------------------------- |
| 计数标签宽度     | CONumButton:widthOfLabel:        |
| 视图的宽度       | CONumButton:width:               |
| 视图的高度       | CONumButton:height:              |
| 边框颜色         | CONumButton:borderColor:         |
| 计数标签边框颜色 | CONumButton:numLabelBorderColor: |
| 减按钮字体颜色   | CONumButton:subFontColor:        |
| 加按钮字体颜色   | CONumButton:addFontColor:        |
| 计数标签字体颜色 | CONumButton:numLabelFontColor:   |
| 计数标签字体大小 | CONumButton:numLabelFontSize:    |
| 边框宽度         | CONumButton:borderWidth:         |
| 计数标签边框宽度 | CONumButton:numLabelBorderWidth: |

```objective-c

- (CGFloat)CONumButton:(CONumButton *)coNumButton width:(CGFloat)width{ //视图的宽度
    NSLog(@"%s",__func__);
    return 150;
}

- (CGFloat)CONumButton:(CONumButton *)coNumButton height:(CGFloat)height{ //视图的高度
    NSLog(@"%s",__func__); 
    return 44;
}

- (CGFloat)CONumButton:(CONumButton *)coNumButton widthOfLable:(CGFloat)width{ //计数标签宽度
    NSLog(@"%s",__func__);
    return 70;
}

- (UIColor *)CONumButton:(CONumButton *)coNumButton borderColor:(UIColor *)borderColor{ //边框颜色
    NSLog(@"%s",__func__);
    return [UIColor systemGray3Color];
}

- (UIColor *)CONumButton:(CONumButton *)coNumButton numLabelBorderColor:(UIColor *)borderColor{ //计数标签边框颜色
    NSLog(@"%s",__func__);
    return [UIColor systemGray3Color];
}

- (UIColor *)CoNumButton:(CONumButton *)button subFontColor:(UIColor *)fontColor{ //减按钮字体颜色
    NSLog(@"%s",__func__);
    return [UIColor systemOrangeColor];
}

- (UIColor *)CoNumButton:(CONumButton *)button addFontColor:(UIColor *)fontColor{ //加按钮字体颜色
    NSLog(@"%s",__func__);
    return [UIColor systemPurpleColor];
}

- (UIColor *)CoNumButton:(CONumButton *)button numLabelFontColor:(UIColor *)fontColor{ //计数标签字体颜色
    NSLog(@"%s",__func__);
    return [UIColor systemYellowColor];
}

- (NSUInteger)CoNumButton:(CONumButton *)button numLabelFontSize:(NSUInteger)fontSize{ //计数标签字体大小
    NSLog(@"%s",__func__);
    return 30;
}

- (CGFloat)CoNumButton:(CONumButton *)button borderWidth:(CGFloat)borderWidth{ //边框宽度
    NSLog(@"%s",__func__);
    return 1;
}

- (CGFloat)CoNumButton:(CONumButton *)button numLabelBorderWidth:(CGFloat)numLabelBorderWidth{ //计数标签边框宽度
    NSLog(@"%s",__func__);
    return 1;
} 
```

#### 安装方法

Get CONumButton

> #import "CONumButton.h"

#### TODO

- Eye candy
- iOS example project
- More tests and examples

