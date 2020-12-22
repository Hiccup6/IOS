

#import <UIKit/UIKit.h>

@class TextModel;

@interface TextListTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UILabel *textLab;


@property (nonatomic, strong) TextModel *textModel;

@end
