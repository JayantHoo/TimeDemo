//
//  ViewController.m
//  TimeDemo
//
//  Created by 翔梦01 on 2018/5/9.
//  Copyright © 2018年 JY.Hoo. All rights reserved.
//

#import "ViewController.h"
#import "JYTableViewCell.h"
#import "JYTimerUtil.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
    for (NSInteger i= 0; i<60; i++) {
        NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
        time += 60*60*i;
        [self.dataSource addObject:@(time)];
    }
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JYTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JYTableViewCell class])];
    [self.view addSubview:self.tableView];
    
    [[JYTimerUtil sharedInstance] timerStart];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JYTableViewCell class]) forIndexPath:indexPath];

    cell.time = [self.dataSource[indexPath.row] integerValue];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
