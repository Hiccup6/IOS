

#import "MainResultTableViewController.h"

#import "MainShowTableViewController.h"
@interface MainResultTableViewController ()

@end
// 获取筛选结果显示

@implementation MainResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"搜索结果";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.resultMArr.count ? self.resultMArr.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"result_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.resultMArr[indexPath.row];
    //UIView *bgView = [[UIView alloc] init];
    //bgView.backgroundColor = [UIColor purpleColor];
    //cell.selectedBackgroundView = bgView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainShowTableViewController *showVC = [[MainShowTableViewController alloc] init];
    
    showVC.showModel = self.resultModelMArr[indexPath.row];
    
    [self presentViewController:showVC animated:YES completion:nil];
    
}

@end
