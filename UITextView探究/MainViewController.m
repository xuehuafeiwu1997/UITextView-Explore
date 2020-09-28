//
//  MainViewController.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "MainViewController.h"
#import "Masonry.h"
#import "FirstSolutionViewController.h"
#import "SecondSolutionViewController.h"
#import "ThirdSolutionViewController.h"
#import "FourthSolutionViewController.h"
#import "FifthSolutionViewController.h"
#import "InputLimitViewController.h"

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UITextView探究";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate/DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"使用协议解决UITextView占位文字";
        return cell;
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"添加一个UILabel，用来显示UITextView占位文字";
        return cell;
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"自定义UITextView解决占位文字问题";
        return cell;
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"另外一种自定义UITextView解决占位文字的问题";
        return cell;
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"使用运行时的特性解决占位文字问题";
        return cell;
    }
    if (indexPath.row == 5) {
        cell.textLabel.text = @"UITextView的输入限制实现";
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        FirstSolutionViewController *vc = [[FirstSolutionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        SecondSolutionViewController *vc = [[SecondSolutionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 2) {
        ThirdSolutionViewController *vc = [[ThirdSolutionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        FourthSolutionViewController *vc = [[FourthSolutionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 4) {
        FifthSolutionViewController *vc = [[FifthSolutionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 5) {
        InputLimitViewController *vc = [[InputLimitViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.estimatedRowHeight = 0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    return _tableView;
}

@end
