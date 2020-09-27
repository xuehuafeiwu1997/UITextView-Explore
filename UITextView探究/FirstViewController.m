//
//  FirstViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "FirstViewController.h"
#import "XMYPlaceHolderTextView.h"
#import "XMYPlaceHolderNewTextView.h"
#import "Masonry.h"

@interface FirstViewController ()<UITextViewDelegate>

@property (nonatomic, strong) XMYPlaceHolderTextView *textView;
@property (nonatomic, strong) XMYPlaceHolderNewTextView *textTwoView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"自定义UITextView";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@100);
    }];
    [self.view addSubview:self.textTwoView];
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"文字发生了变化");
}

- (XMYPlaceHolderTextView *)textView {
    if (_textView) {
        return _textView;
    }
    _textView = [[XMYPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 100)];
    _textView.backgroundColor = [UIColor grayColor];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.textColor = [UIColor whiteColor];
    _textView.placeHolderColor = [UIColor whiteColor];
    _textView.placeHolder = @"这是占位文字";
    _textView.delegate = self;
    return _textView;
}

- (XMYPlaceHolderNewTextView *)textTwoView {
    if (_textTwoView) {
        return _textTwoView;
    }
    _textTwoView = [[XMYPlaceHolderNewTextView alloc] initWithFrame:CGRectMake(0, 150, CGRectGetWidth(self.view.bounds), 100)];
    _textTwoView.backgroundColor = [UIColor greenColor];
    _textTwoView.font = [UIFont systemFontOfSize:18.f];
    _textTwoView.textColor = [UIColor whiteColor];
    _textTwoView.placeHolder = @"Hello，许明洋";
    _textTwoView.placeHolderColor = [UIColor blueColor];
    _textTwoView.labelFont = [UIFont systemFontOfSize:30];
    return _textTwoView;
}

@end
