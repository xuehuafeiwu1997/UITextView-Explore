//
//  FirstSolutionViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/28.
//  Copyright © 2020 许明洋. All rights reserved.
//第一种解决办法，使用UITextView的协议更改文本实现占位文字的效果

#import "FirstSolutionViewController.h"
#import "Masonry.h"

@interface FirstSolutionViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;

@end

@implementation FirstSolutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第一种解决办法";
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@300);
    }];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"请输入相应的内容"]) {
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length < 1) {
        textView.text = @"请输入相应的内容";
    }
}

- (UITextView *)textView {
    if (_textView) {
        return _textView;
    }
    _textView = [[UITextView alloc] initWithFrame:CGRectZero];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.textColor = [UIColor whiteColor];
    _textView.backgroundColor = [UIColor greenColor];
    _textView.textContainerInset = UIEdgeInsetsMake(25, 10, 10, 10);
    _textView.text = @"请输入相应的内容";
    _textView.delegate = self;
    return _textView;
}

@end
