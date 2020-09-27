//
//  FirstViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "FirstViewController.h"
#import "XMYPlaceHolderTextView.h"
#import "Masonry.h"

@interface FirstViewController ()<UITextViewDelegate>

@property (nonatomic, strong) XMYPlaceHolderTextView *textView;

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
        make.height.equalTo(@300);
    }];
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"文字发生了变化");
}

- (XMYPlaceHolderTextView *)textView {
    if (_textView) {
        return _textView;
    }
    _textView = [[XMYPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 300)];
    _textView.backgroundColor = [UIColor grayColor];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.textColor = [UIColor whiteColor];
    _textView.placeHolderColor = [UIColor whiteColor];
    _textView.placeHolder = @"这是占位文字";
    _textView.delegate = self;
    return _textView;
}

@end
