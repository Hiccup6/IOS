

#import <UIKit/UIKit.h>

@interface PictureEditViewController : UIViewController
// 添加图片按钮
@property (nonatomic, strong) UIButton *addPictureBtn;
// 图片
@property (nonatomic, strong) UIImageView *imgView;
// 文本说明
@property (nonatomic, strong) UITextField *textField;

@end
