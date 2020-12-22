

#import <UIKit/UIKit.h>

@class CustomModel;
@interface MainShowTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIButton *voiceBtn;

@property (nonatomic, strong) CustomModel *customModel;

@end
