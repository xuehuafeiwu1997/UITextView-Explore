//
//  SecondViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SecondViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"运行时机制解决占位文字";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //通过运行时，发现UITextView有一个叫做“_placeHolderLabel”的变量
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
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
    [textView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:textView];
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"请输入内容";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    /*
     必须得加这句话，不然的话显示不出来
     */
    [textView addSubview:placeHolderLabel];
    
    [textView setFont:[UIFont systemFontOfSize:18.f]];
    placeHolderLabel.font = [UIFont systemFontOfSize:18.f];
    [textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}

@end
