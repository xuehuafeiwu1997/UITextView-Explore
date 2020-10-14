//
//  CustomLabel.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/10/14.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

@end
