//
//  ThirdSolutionViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/28.
//  Copyright © 2020 许明洋. All rights reserved.
//使用自定义UITextView实现占位文字的效果，这是第一种占位文字的写法

#import "ThirdSolutionViewController.h"
#import "XMYPlaceHolderTextView.h"
#import "Masonry.h"

@interface ThirdSolutionViewController ()

@property (nonatomic, strong) XMYPlaceHolderTextView *textView;

@end

@implementation ThirdSolutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第三种解决办法";
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@300);
    }];
}

- (XMYPlaceHolderTextView *)textView {
    if (_textView) {
        return _textView;
    }
    _textView = [[XMYPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 300)];
    _textView.backgroundColor = [UIColor greenColor];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.textColor = [UIColor whiteColor];
    _textView.placeHolderColor = [UIColor lightGrayColor];
    _textView.placeHolder = @"请输入相应的内容";
    return _textView;
}

@end
