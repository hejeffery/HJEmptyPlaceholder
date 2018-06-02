//
//  HJEmptyPlaceholder.m
//  HJEmptyPlaceholder
//
//  Created by HeJeffery on 2018/5/20.
//  Copyright © 2018年 HeJeffery. All rights reserved.
//

#import "HJEmptyPlaceholder.h"

static const CGFloat kPlaceholderImageViewHW = 120.0f;
static const CGFloat kOffset = 15.0f;

@interface HJEmptyPlaceholder()

@property (nonatomic, weak) UIActivityIndicatorView *loadingIndicatorView;
@property (nonatomic, weak) UIImageView *placeholderImageView;
@property (nonatomic, weak) UILabel *placeholderLabel;
@property (nonatomic, weak) UIButton *placeholderButton;

@end

@implementation HJEmptyPlaceholder

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (!self.emptyConfig) {
        [NSException raise:@"HJEmptyPlaceholder初始化出错" format:@"请设置emptyConfig属性"];

    } else {
        self.emptyConfig(self.placeholderImageView, self.placeholderLabel, self.placeholderButton);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);

    CGFloat placeholderButtonW = 100.0f;
    CGFloat placeholderButtonH = 40.0f;
    CGFloat placeholderButtonX = (width - placeholderButtonW) * 0.5;
    CGFloat placeholderButtonY = height * 0.5 - kOffset - placeholderButtonH;

    if (!UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        // 横屏
        placeholderButtonY = height * 0.5 + kOffset * 3;
    }
    self.placeholderButton.frame = CGRectMake(placeholderButtonX,
                                              placeholderButtonY,
                                              placeholderButtonW,
                                              placeholderButtonH);

    CGFloat placeholderLabelX = 0.0f;
    CGFloat placeholderLabelW = width;
    CGFloat placeholderLabelH = 20.0f;
    CGFloat placeholderLabelY = placeholderButtonY - placeholderLabelH - kOffset;
    self.placeholderLabel.frame = CGRectMake(placeholderLabelX,
                                             placeholderLabelY,
                                             placeholderLabelW,
                                             placeholderLabelH);

    CGFloat placeholderImageViewX = (width - kPlaceholderImageViewHW) * 0.5;
    CGFloat placeholderImageViewY = placeholderLabelY - kPlaceholderImageViewHW - kOffset;
    
    self.placeholderImageView.frame = CGRectMake(placeholderImageViewX,
                                                 placeholderImageViewY,
                                                 kPlaceholderImageViewHW,
                                                 kPlaceholderImageViewHW);

    CGFloat loadingIndicatorViewWH = 30.0f;
    CGFloat loadingIndicatorViewX = (width - loadingIndicatorViewWH) * 0.5;
    CGFloat loadingIndicatorViewY = (height - loadingIndicatorViewWH) * 0.5;
    self.loadingIndicatorView.frame = CGRectMake(loadingIndicatorViewX,
                                                 loadingIndicatorViewY,
                                                 loadingIndicatorViewWH,
                                                 loadingIndicatorViewWH);
}

- (void)setup {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
    [self addGestureRecognizer:tapGestureRecognizer];
    
    UIImageView *placeholderImageView = [[UIImageView alloc] init];
    placeholderImageView.contentMode = UIViewContentModeScaleAspectFit;
    placeholderImageView.clipsToBounds = NO;
    [self addSubview:placeholderImageView];
    self.placeholderImageView = placeholderImageView;
    
    UILabel *placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.font = [UIFont systemFontOfSize:13.0f];
    placeholderLabel.textAlignment = NSTextAlignmentCenter;
    placeholderLabel.text = @"没有数据";
    [self addSubview:placeholderLabel];
    self.placeholderLabel = placeholderLabel;
    
    UIButton *placeholderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [placeholderButton addTarget:self
                          action:@selector(buttonAction:)
                forControlEvents:UIControlEventTouchUpInside];
    [placeholderButton setTitle:@"点击重试" forState:UIControlStateNormal];
    placeholderButton.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [self addSubview:placeholderButton];
    self.placeholderButton = placeholderButton;
    
    UIActivityIndicatorView *loadingIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loadingIndicatorView.hidden = YES;
    [self addSubview:loadingIndicatorView];
    self.loadingIndicatorView = loadingIndicatorView;

}

- (void)buttonAction:(UIButton *)button {
    if (self.emptyAction) {
        self.loadingIndicatorView.hidden = NO;
        [self.loadingIndicatorView startAnimating];
        self.emptyAction(button);
    }
}

- (void)tapGestureRecognizerAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (self.touchOutsideExecute) {
        if (self.emptyAction) {
            [self buttonAction:self.placeholderButton];

        } else {
            [NSException raise:@"HJEmptyPlaceholder点击事件出错" format:@"请设置emptyAction属性"];
        }
    }
}

@end
