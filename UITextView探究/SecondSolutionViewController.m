//
//  SecondSolutionViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/28.
//  Copyright © 2020 许明洋. All rights reserved.
//第二种解决办法,使用UILabel添加在UITextView上，来实现占位文字的效果

#import "SecondSolutionViewController.h"
#import "UITextView+keyBoard.h"
#import "Masonry.h"

@interface SecondSolutionViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeHolder;

@end

@implementation SecondSolutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第二种解决办法";
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@300);
    }];
    [self.textView addSubview:self.placeHolder];
    [self.placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textView).offset(15);
        make.top.equalTo(self.textView).offset(25);
        make.width.greaterThanOrEqualTo(@0);
        make.height.greaterThanOrEqualTo(@0);
    }];
}

#pragma mark - delegate
- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.placeHolder.hidden = YES;
    } else {
        self.placeHolder.hidden = NO;
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
    _textView.shouldShowHideKeyBoardBtn = YES;
    _textView.delegate = self;
    return _textView;
}

- (UILabel *)placeHolder {
    if (_placeHolder) {
        return _placeHolder;
    }
    _placeHolder = [[UILabel alloc] initWithFrame:CGRectZero];
    _placeHolder.font = [UIFont systemFontOfSize:18];
    _placeHolder.textColor = [UIColor lightGrayColor];
    _placeHolder.text = @"请输入相应的内容";
    _placeHolder.textAlignment = NSTextAlignmentLeft;
    return _placeHolder;
}

@end
