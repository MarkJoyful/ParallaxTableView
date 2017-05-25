//
//  ViewController.m
//  ParallaxImageTable
//
//  Created by bob Chris on 2017/5/25.
//  Copyright © 2017年 bob Chris. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *parallaxTable;
@end

@implementation ViewController{
    
    NSArray *imageSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imageSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14"];
    
    self.parallaxTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.parallaxTable.delegate = self;
    self.parallaxTable.dataSource = self;
    self.parallaxTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.parallaxTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return imageSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"parallax";
    ParallaxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ParallaxTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.parallaxImageView.image = [UIImage imageNamed:imageSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    for (ParallaxTableViewCell *cell in self.parallaxTable.visibleCells) {
        [cell parallaxCellScroll:self.view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
