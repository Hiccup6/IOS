

#import <UIKit/UIKit.h>

#import "MainResultTableViewController.h"

@interface MainTableViewController : UITableViewController 


/* 子视图的数据属性 */
@property (nonatomic, strong) NSMutableArray *tableListMArr;//模型-->数据

@property (nonatomic, strong) NSMutableArray *tableMArr;//数据库-->数据

//  查询控制器
@property (nonatomic, strong) UISearchController *searchController;

/* 展示结果的辅助属性 */
@property (nonatomic, strong) MainResultTableViewController *resultsController;
@property (nonatomic, strong) NSMutableArray *resultMArr;

@end
