//
//  ViewController.m
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableView.h"
#import "HomeTableViewCell.h"
#import "HomeViewModel.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)HomeTableView *homeTableView;
@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //?title 或者setTitle本质上没有什么区别
    self.title = @"iOS开发";
    
    //?
    self.dataArr = [NSMutableArray array];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    //添加导航条上的控件
    [self configNav];
    //布局view
    [self setUpView];
    //数据处理
    [self dataAccess];
    
    //demo写完后发现这个例子主要是做了好多vc的瘦身 有的地方值得学习 有的地方还是感觉别扭
    
}

- (void)dataAccess
{
    HomeViewModel *homeViewModel = [[HomeViewModel alloc] init];

    [homeViewModel handleDataWithSuccess:^(NSArray *arr) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:arr];
        [self.homeTableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);

    }];
    
}


- (void)configNav
{
    UIButton *settingBtn = [[UIButton alloc] init];
    
    settingBtn.frame = CGRectMake(0, 0, 33.0f, 33.0f);
    
    [settingBtn setImage:[UIImage imageNamed:@"navigationbar_setting"] forState:UIControlStateNormal];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:settingBtn]];
    
}

- (void)setUpView
{
    //?
    [self.view addSubview:self.homeTableView];
}

- (HomeTableView *)homeTableView
{
    if(!_homeTableView)
    {
        //带下划线，表示跳过get和set方法，直接操作成员变量
        _homeTableView = [[HomeTableView alloc] initWithFrame:self.view.frame];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        [_homeTableView setRowHeight:80.0f];
    }
    
    return _homeTableView;
}

//- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //?编码风格
    static NSString *CELLIDENTIFER = @"CELLIDENTIFER";
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFER];
    
    if(!cell) {
        
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLIDENTIFER];
    }
    
    [cell setData:self.dataArr[indexPath.row]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
