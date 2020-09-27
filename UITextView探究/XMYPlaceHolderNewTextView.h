//
//  XMYPlaceHolderNewTextView.h
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMYPlaceHolderNewTextView : UITextView

@property (nonatomic, copy) NSString *placeHolder;
@property (nonatomic, strong) UIColor *placeHolderColor;
@property (nonatomic, strong) UIFont *labelFont;

@end

NS_ASSUME_NONNULL_END
