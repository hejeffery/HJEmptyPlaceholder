//
//  UIScrollView+HJEmptyPlaceholder.h
//  HJEmptyPlaceholder
//
//  Created by HeJeffery on 2018/5/20.
//  Copyright © 2018年 HeJeffery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJEmptyPlaceholder.h"

@interface UIScrollView (HJEmptyPlaceholder)
/*!
 @property
 @abstract 占位的View
 */
@property (nonatomic, strong) HJEmptyPlaceholder *emptyPlaceholder;

/*!
 @method
 @abstract 是否显示占位的view
 
 @param isShow YES显示，NO隐藏
 */
- (void)hj_showEmptyPlaceholder:(BOOL)isShow;

/*!
 @method
 @abstract 是否显示占位的view
 
 @param emptyPrompt 提示
 */
- (void)hj_EmptyPrompt:(NSString *)emptyPrompt;

/*!
 @method
 @abstract 是否显示占位的view
 
 @param errorPrompt 错误的提示
 */
- (void)hj_ErrorPrompt:(NSString *)errorPrompt;

@end
