//
//  XMYPlaceHolderNewTextView.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "XMYPlaceHolderNewTextView.h"

@interface XMYPlaceHolderNewTextView()

@property (nonatomic, strong) UILabel *label;

@end

@implementation XMYPlaceHolderNewTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
        //使用通知监听文字改变，如果不使用这个，输入文字时不会调用drawRect方法
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textDidChange:(NSNotification *)notification {
    if (self.hasText) {
        self.label.hidden = YES;
    } else {
        self.label.hidden = NO;
    }
//    [self setNeedsDisplay];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.label sizeToFit];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
//    if (self.hasText) {
//        self.label.hidden = YES;
//        return;
//    }
//    self.label.hidden = NO;
}

- (UILabel *)label {
    if (_label) {
        return _label;
    }
    _label = [[UILabel alloc] initWithFrame:CGRectMake(5, 8, CGRectGetWidth(self.bounds) - 10, 15)];
    _label.font = [UIFont systemFontOfSize:18];
    _label.textColor = [UIColor lightGrayColor];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.text = @"此处输入默认占位文字";
    return _label;
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = placeHolder;
    self.label.text = placeHolder;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    _placeHolderColor = placeHolderColor;
    self.label.textColor = placeHolderColor;
}

- (void)setLabelFont:(UIFont *)labelFont {
    _labelFont = labelFont;
    self.label.font = labelFont;
}

@end
