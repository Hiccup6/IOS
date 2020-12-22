
#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController
// 继承UINavigationController类
+ (void)initialize
{
    // 设置导航栏
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundColor:[UIColor colorWithRed:145.0 / 255.0 green:158.0 / 255.0 blue:230.0 / 255.0 alpha:1.0]];
    //[bar setBackgroundImage:[UIImage imageNamed:@"selectTarbar_bg_all1"] forBarMetrics:UIBarMetricsDefault];
    
    // 创建可变词典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];  // 设置字体
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];   //设置颜色
    [bar setTitleTextAttributes:attrs];
    
}

@end
