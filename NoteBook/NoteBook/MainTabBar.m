

#import "MainTabBar.h"

@implementation MainTabBar
// 下方菜单设置 继承UITabeBar类
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        
        [self setup];
    }
    return self;
}

- (void)setup
{
    // 设置背景
    self.backgroundColor = [UIColor colorWithRed:145.0 / 255.0 green:158.0 / 255.0 blue:230.0 / 255.0 alpha:1.0];
    //self.backgroundImage = [UIImage imageNamed:@"bg_main2"];
    // 设置文字字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // 设置文字颜色和字体样式
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    UIImageView *selectImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ZScreenW / 2.0, tabbarH)];
    //selectImgView.image = [UIImage imageNamed:@"exchange_bg_home@2x"];
    [self addSubview:selectImgView];
    self.selectImgView = selectImgView;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.height = tabbarH;
    self.y = [self superview].height - tabbarH;
    
}

@end
