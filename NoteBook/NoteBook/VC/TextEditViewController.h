

#import <UIKit/UIKit.h>

@class TextModel;
@interface TextEditViewController : UIViewController<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) TextModel *textModel;

@end
