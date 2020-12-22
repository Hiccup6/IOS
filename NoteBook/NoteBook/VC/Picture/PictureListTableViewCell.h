

#import <UIKit/UIKit.h>

@class PictureModel;
@interface PictureListTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *contentLab;

@property (nonatomic, strong) PictureModel *pictureModel;
@end
