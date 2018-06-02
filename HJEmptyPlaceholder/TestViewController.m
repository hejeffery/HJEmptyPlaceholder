//
//  TestViewController.m
//  HJEmptyPlaceholder
//
//  Created by HeJeffery on 2018/5/20.
//  Copyright © 2018年 HeJeffery. All rights reserved.
//

#import "TestViewController.h"
#import "UIScrollView+HJEmptyPlaceholder.h"
#import "HJEmptyPlaceholder.h"

@interface TestViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) HJEmptyPlaceholder *emptyPlaceholder;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    HJEmptyPlaceholder *emptyPlaceholder = [[HJEmptyPlaceholder alloc] init];
    emptyPlaceholder.emptyConfig = ^(UIImageView *imageView, UILabel *label, UIButton *button) {
        imageView.backgroundColor = [UIColor blueColor];
        button.backgroundColor = [UIColor brownColor];
    };
    emptyPlaceholder.emptyAction = ^(UIButton *button) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [tableView hj_showEmptyPlaceholder:NO];
        });
    };
    tableView.emptyPlaceholder = emptyPlaceholder;
    self.emptyPlaceholder = emptyPlaceholder;
    tableView.rowHeight = 44.0f;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
    // 模拟没数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView hj_showEmptyPlaceholder:YES];
        [tableView hj_ErrorPrompt:@"没有网络，请稍后再试"];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.textColor = [UIColor redColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"---------row = %ld", indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
