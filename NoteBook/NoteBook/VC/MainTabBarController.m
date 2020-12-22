

#import "MainTabBarController.h"

#import "MainTabBar.h"
#import "MainNavigationController.h"
#import "MainTableViewController.h"

#import "TextListViewController.h"
#import "PictureListViewController.h"

@interface MainTabBarController()
@end

@implementation MainTabBarController
// 下方导航菜单初始化 继承UITabBarController类
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupChildVC:[[TextListViewController alloc] init] title:@"文本记事" image:@"add"];
    
    [self setupChildVC:[[PictureListViewController alloc] init] title:@"图文记事" image:@"picture2"];
    
    [self setValue:[[MainTabBar alloc] init] forKey:@"tabBar"];
    
    [self setupSQLite];


}

/**
 * 初始化子控制器
 */
- (void)setupChildVC:(MainTableViewController *)vc title:(NSString *)title image:(NSString *)image
{
    
    vc.title = title;
    vc.tabBarItem.title = title;
    //vc.tabBarItem.image = [UIImage imageNamed:image];
    
    //包装一个导航控制器，添加导航控制器为tabbar的子控制器
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:vc];
    // 界面添加导航栏
    [self addChildViewController:nav];
}

/**
 * 控制选项卡切换
 */
- (void)tabBar:(MainTabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    CGFloat selectImgViewY = 0;
    CGFloat selectImgViewW = ZScreenW / 2.0;
    CGFloat selectImgViewH = tabbarH;
    
    CGFloat selectImgViewX = selectImgViewW * index;
    tabBar.selectImgView.frame = CGRectMake(selectImgViewX, selectImgViewY, selectImgViewW, selectImgViewH);
    
}

/**
 * 创建 打开数据库
 */
- (void)setupSQLite
{
    [[SQLiteManager sharedManager] openDataBaseWithName:@"config"];
}

@end
