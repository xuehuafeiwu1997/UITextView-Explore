//
//  XMYPlaceHolderTextView.h
//  UITextView探究
//
//  Created by 许明洋 on 2020/9/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMYPlaceHolderTextView : UITextView

/**占位文字*/
@property (nonatomic, copy) NSString *placeHolder;

/**占位文字颜色*/
@property (nonatomic, strong) UIColor *placeHolderColor;

@end

NS_ASSUME_NONNULL_END
