//
//  CZTableViewController.m
//  002微博评论
//
//  Created by 谢飞 on 2021/8/19.
//

#import "CZTableViewController.h"
#import "CZWeibo.h"
#import "CZWeiboCell.h"

@interface CZTableViewController ()

@property (nonatomic, strong) NSArray *weibos;
@end

@implementation CZTableViewController

#pragma mark - 懒加载

- (NSString *)weibos
{
    if (_weibos == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZWeibo *model = [CZWeibo weiboWithDict:dict];
            [arrayModels addObject:model];
        }
        _weibos = arrayModels;
    }
    return _weibos;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.weibos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    //1.获取模型数据
    CZWeibo *model = self.weibos[indexPath.row];
    //2.创建单元格
    static NSString *ID = @"weibo_cell";
    CZWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CZWeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //3.设置单元格内容
    cell.weibo = model;
    //4.返回单元格
    return cell;
}


@end
