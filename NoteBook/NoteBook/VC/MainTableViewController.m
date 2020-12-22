
#import "MainTableViewController.h"

#import "CustomModel.h"
// 搜索框
@interface MainTableViewController ()<UISearchResultsUpdating, UISearchControllerDelegate>

@end

@implementation MainTableViewController

-(NSArray *)tableListMArr{
    if (!_tableListMArr) {
        _tableListMArr = [NSMutableArray arrayWithCapacity:20];//这个数量没什么用，但是要注意创建的数组是可变的
    }
    return _tableListMArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//  实现查找功能
    [self setupSearch];
    
}

// 动画
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.searchController.active) {
        
        self.searchController.active = NO;
        [self.searchController.searchBar removeFromSuperview];
    }
}

- (void)setupSearch
{
    self.resultsController = [[MainResultTableViewController alloc] init];
    //  搜索结果背景颜色
    self.resultsController.view.backgroundColor = [UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:0.7];
    //self.resultsController.view.backgroundColor = [UIColor grayColor];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:_resultsController];
    // 搜索背景颜色
    self.searchController.view.backgroundColor = [UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:0.7];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
}

// 添加下拉手势

#pragma mark - UISearchResultsUpdating

//  实现查询结果处理的代理方法，注：这是一个必须实现的方法。
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    //  设置谓词，谓词就是根据输入的内容去匹配数据，并返回一个查询的结果
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",self.searchController.searchBar.text];
    
    //  设置查询结果界面要显示的数据
    self.resultMArr = [NSMutableArray arrayWithArray:[[self loadAllDate] filteredArrayUsingPredicate:predicate]];
    self.resultsController.resultMArr = self.resultMArr;
    
    self.resultsController.resultModelMArr = [self loadAllModelByPredicate];
    
    //  不要忘记刷新结果数据界面
    [self.resultsController.tableView reloadData];
}
// 加载日期
- (NSMutableArray *)loadAllDate
{
    NSMutableArray *allModelMArr = [TableViewData loadCustomData];
    
    NSMutableArray *allDateMArr = [[NSMutableArray alloc] init];
    
    for (CustomModel *model in allModelMArr) {
        
        [allDateMArr addObject:model.title];
    }
    
    return allDateMArr;
}


// 过滤后的模型数组
- (NSMutableArray *)loadAllModelByPredicate
{
    NSMutableArray *allModelMArr = [TableViewData loadCustomData];
    NSMutableArray *resultModelMArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < allModelMArr.count; i ++) {

        CustomModel *model = allModelMArr[i];
        
        for (NSString *predicate in self.resultMArr) {
            
            if ([model.title containsString:predicate])
            
                [resultModelMArr addObject:allModelMArr[i]];
        }
        
    }
    
    return resultModelMArr;
}


@end
