//
//  XMYPlaceHolderTextView.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "XMYPlaceHolderTextView.h"

@implementation XMYPlaceHolderTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //设置默认字体
        self.font = [UIFont systemFontOfSize:15];
        //设置默认字体颜色
        self.placeHolderColor = [UIColor grayColor];
        //使用通知监听文字变化
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textViewDidChange:(NSNotification *)notification {
    [self setNeedsDisplay];
}

/**
 每次调用drawRect方法，都会将以前画的东西清理掉
 */
- (void)drawRect:(CGRect)rect {
    if (self.hasText) {
        return;
    }
    //属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeHolderColor;
    
    //画文字
    rect.origin.x = 15;
    rect.origin.y = 25;
    rect.size.width -= 2 * rect.origin.x;
    [self.placeHolder drawInRect:rect withAttributes:attrs];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setNeedsDisplay];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - setter
- (void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = [placeHolder copy];
    [self setNeedsDisplay];
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    _placeHolderColor = placeHolderColor;
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self setNeedsDisplay];
}

@end
