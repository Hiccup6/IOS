

#import "MainShowTableViewController.h"
#import "CustomModel.h"
#import "MainShowTableViewCell.h"

@interface MainShowTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@end
// 搜索结果点击进入的页面
@implementation MainShowTableViewController

static NSString *custom_cell = @"custom_cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    // 没有分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    //[backBtn setImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    // 返回字体颜色
    //[backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [backBtn setTitleColor:[UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:1] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor colorWithRed:145.0/255 green:158.0/255 blue:230.0/255 alpha:1] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 20 + cellMargin, ZScreenW*0.2, 35);
    [self.view addSubview:backBtn];
    self.backBtn = backBtn;
    
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (MainShowTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:custom_cell];
    
    if (!cell) {
        cell = [[MainShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:custom_cell];
    }
    
    cell.customModel = self.showModel;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.showModel.customCellH + cellMargin * 2;
}

@end
