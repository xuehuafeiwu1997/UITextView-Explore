//
//  UITextView+keyBoard.m
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/28.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "UITextView+keyBoard.h"
#import <objc/runtime.h>

@implementation UITextView (keyBoard)
@dynamic shouldShowHideKeyBoardBtn;

- (BOOL)shouldShowHideKeyBoardBtn {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setShouldShowHideKeyBoardBtn:(BOOL)shouldShowHideKeyBoardBtn {
    if (shouldShowHideKeyBoardBtn) {
        [self addToolBarDoneButton];
    }
    objc_setAssociatedObject(self, @selector(shouldShowHideKeyBoardBtn), @(shouldShowHideKeyBoardBtn), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//在弹出的键盘上面加一个view来防治退出键盘的按钮
- (void)addToolBarDoneButton {
    UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray *buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    [topView setItems:buttonsArray];
    [self setInputAccessoryView:topView];
}

- (void)dismissKeyBoard {
    [self resignFirstResponder];
}

@end
