//
//  FifthSolutionViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/28.
//  Copyright © 2020 许明洋. All rights reserved.
//使用运行时来解决UITextView的占位文字显示问题

#import "FifthSolutionViewController.h"
#import "UITextView+keyBoard.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "CustomLabel.h"

@interface FifthSolutionViewController ()

@property (nonatomic) CustomLabel *customLabel;

@end

@implementation FifthSolutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第五种解决办法";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //通过运行时，我们会发现UITextView有一个叫做"_placeHolderLabel"的变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UITextView class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *objcName = [NSString stringWithUTF8String:name];
        NSLog(@"%d : %@",i,objcName);
    }
    
    [self setupTextView];
}

- (void)setupTextView {
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    textView.shouldShowHideKeyBoardBtn = YES;
    textView.contentInset = UIEdgeInsetsMake(25, 10, 10, 10);
    [textView setBackgroundColor:[UIColor greenColor]];
    [textView setFont:[UIFont systemFontOfSize:18.f]];
    [self.view addSubview:textView];
    /*
     必须得加这句话，不然的话显示不出来
     */
    [textView addSubview:self.customLabel];

    [textView setFont:[UIFont systemFontOfSize:18.f]];
    self.customLabel.font = [UIFont systemFontOfSize:18.f];
    [textView setValue:self.customLabel forKey:@"_placeholderLabel"];
}

- (CustomLabel *)customLabel {
    if (_customLabel) {
        return _customLabel;
    }
    _customLabel = [[CustomLabel alloc] init];
    _customLabel.text = @"请输入相应的内容";
    _customLabel.numberOfLines = 0;
    _customLabel.textColor = [UIColor lightGrayColor];
    _customLabel.edgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    [_customLabel sizeToFit];
    return _customLabel;
}

@end
