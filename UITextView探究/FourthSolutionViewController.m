//
//  FourthSolutionViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/28.
//  Copyright © 2020 许明洋. All rights reserved.
//使用自定义UITextView来显示占位文字，这个是在自定义中添加了一个label，和第二种比较的好处是可以复用，不需要每次定义一个UITextView都得重新定义一个label

#import "FourthSolutionViewController.h"
#import "XMYPlaceHolderNewTextView.h"
#import "UITextView+keyBoard.h"
#import "Masonry.h"

@interface FourthSolutionViewController ()

@property (nonatomic, strong) XMYPlaceHolderNewTextView *textView;

@end

@implementation FourthSolutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第四种解决办法";
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@300);
    }];
}

- (XMYPlaceHolderNewTextView *)textView {
    if (_textView) {
        return _textView;
    }
    _textView = [[XMYPlaceHolderNewTextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 300)];
    _textView.backgroundColor = [UIColor greenColor];
    _textView.font = [UIFont systemFontOfSize:18.f];
    _textView.textColor = [UIColor whiteColor];
    _textView.placeHolder = @"请输入相应的内容";
    _textView.placeHolderColor = [UIColor lightGrayColor];
    _textView.labelFont = [UIFont systemFontOfSize:18];
    _textView.shouldShowHideKeyBoardBtn = YES;
    return _textView;
}

@end
