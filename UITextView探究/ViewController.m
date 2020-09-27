//
//  ViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"主界面";
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@300);
    }];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
    
    
    [self addToolBarForKeyBoard];
}

- (void)addToolBarForKeyBoard {
    //在键盘上加一个隐藏按钮来隐藏键盘
    UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    //设置style
    [topView setBarStyle:UIBarStyleBlack];
    
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(2, 5, 50, 25);
    [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[self createNewImage] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    NSArray *buttonArray = [NSArray arrayWithObjects:btnSpace,item, nil];
    [topView setItems:buttonArray];
    [self.textView setInputAccessoryView:topView];
}

- (UIImage *)createImage {
    UIGraphicsBeginImageContext(CGSizeMake(50, 25));
    CGContextRef ref = UIGraphicsGetCurrentContext();
    UIRectClip(CGRectMake(0, 0, 25, 12.5));
    [[UIColor redColor] setStroke];
    [[UIColor grayColor] setFill];
    CGContextSetLineWidth(ref, 10);
    UIRectFill(CGRectMake(0, 0, 25, 12.5));
    UIRectFrame(CGRectMake(0, 0, 50, 25));
    //拿到UIImage实例
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //结束位图上下文编辑
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)createNewImage {
    UIGraphicsBeginImageContext(CGSizeMake(50, 25));
    [[UIColor yellowColor] setFill];
    UIRectFill(CGRectMake(0, 0, 50, 25));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dismissKeyBoard {
    [self.textView resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView {
    
}

- (UITextView *)textView {
    if (_textView) {
        return _textView;
    }
    _textView = [[UITextView alloc] initWithFrame:CGRectZero];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.textColor = [UIColor whiteColor];
    _textView.backgroundColor = [UIColor grayColor];
    _textView.textContainerInset = UIEdgeInsetsMake(25, 10, 10, 10);
    _textView.delegate = self;
    return _textView;
}

- (UIImageView *)imageView {
    if (_imageView) {
        return _imageView;
    }
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _imageView.backgroundColor = [UIColor blackColor];
    _imageView.image = [self createNewImage];
    _imageView.contentMode = UIViewContentModeCenter;
    return _imageView;
}

@end
