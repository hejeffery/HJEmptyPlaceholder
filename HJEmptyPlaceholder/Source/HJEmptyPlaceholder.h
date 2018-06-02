//
//  HJEmptyPlaceholder.h
//  HJEmptyPlaceholder
//
//  Created by HeJeffery on 2018/5/20.
//  Copyright © 2018年 HeJeffery. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^EmptyAction)(UIButton *);

typedef void (^EmptyConfig)(UIImageView *, UILabel *, UIButton *);

@interface HJEmptyPlaceholder : UIView

@property (nonatomic, copy) EmptyAction emptyAction;
@property (nonatomic, copy) EmptyConfig emptyConfig;

/*!
 @property
 @abstract 点击空白的view是否要响应事件，默认是NO
 */
@property (nonatomic, assign) BOOL touchOutsideExecute;

@end
