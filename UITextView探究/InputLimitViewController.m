//
//  InputLimitViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/28.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "InputLimitViewController.h"
#import "XMYPlaceHolderTextView.h"
#import "UITextView+keyBoard.h"
#import "Masonry.h"

#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#define MAXLENGTH 10

@interface InputLimitViewController ()<UITextViewDelegate>

@property (nonatomic, strong) XMYPlaceHolderTextView *textView;

@end

@implementation InputLimitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"UIText输入限制测试";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
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
    _textView.shouldShowHideKeyBoardBtn = YES;
    _textView.placeHolder = @"请输入相应的内容";
    _textView.keyboardType = UIKeyboardTypeASCIICapable;//限制只能输入英文、字母和数字
    _textView.delegate = self;
    return _textView;
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (textView.text.length >= MAXLENGTH) {
        return NO;
    }
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHANUM] invertedSet];
    NSString *filtered = [[text componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return [text isEqualToString:filtered];
}

@end
