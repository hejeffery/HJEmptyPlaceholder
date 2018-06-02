//
//  UIScrollView+HJEmptyPlaceholder.m
//  HJEmptyPlaceholder
//
//  Created by HeJeffery on 2018/5/20.
//  Copyright © 2018年 HeJeffery. All rights reserved.
//

#import "UIScrollView+HJEmptyPlaceholder.h"
#import <objc/runtime.h>

static const char kEmptyPlaceholder = '\0';

@implementation UIScrollView (HJEmptyPlaceholder)

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (self.emptyPlaceholder) {
        [newSuperview insertSubview:self.emptyPlaceholder atIndex:0];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.emptyPlaceholder
                                                               attribute:NSLayoutAttributeTopMargin
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:newSuperview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0f
                                                                constant:0.0f];
        [newSuperview addConstraint:top];
        
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.emptyPlaceholder
                                                                attribute:NSLayoutAttributeLeftMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:newSuperview
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1.0f
                                                                 constant:0.0f];
        [newSuperview addConstraint:left];
        
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.emptyPlaceholder
                                                                  attribute:NSLayoutAttributeBottomMargin
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:newSuperview
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0f
                                                                   constant:0.0f];
        [newSuperview addConstraint:bottom];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.emptyPlaceholder
                                                                 attribute:NSLayoutAttributeRightMargin
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:newSuperview
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0f
                                                                  constant:0.0f];
        [newSuperview addConstraint:right];
    }
}

- (void)setEmptyPlaceholder:(HJEmptyPlaceholder *)emptyPlaceholder {
    if (emptyPlaceholder != self.emptyPlaceholder) {
        [self.emptyPlaceholder removeFromSuperview];
        emptyPlaceholder.hidden = YES;
        objc_setAssociatedObject(self, &kEmptyPlaceholder, emptyPlaceholder, OBJC_ASSOCIATION_RETAIN);
    }
}

- (HJEmptyPlaceholder *)emptyPlaceholder {
    return objc_getAssociatedObject(self, &kEmptyPlaceholder);
}

- (void)hj_showEmptyPlaceholder:(BOOL)isShow {
    self.hidden = isShow;
    self.emptyPlaceholder.hidden = !isShow;
}

- (void)hj_EmptyPrompt:(NSString *)emptyPrompt {
    [self.emptyPlaceholder setValue:emptyPrompt forKeyPath:@"placeholderLabel.text"];
}

- (void)hj_ErrorPrompt:(NSString *)errorPrompt {
    [self.emptyPlaceholder setValue:errorPrompt forKeyPath:@"placeholderLabel.text"];
}

@end
