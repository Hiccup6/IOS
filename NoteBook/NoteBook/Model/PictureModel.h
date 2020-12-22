

#import <Foundation/Foundation.h>
// 图文编辑的数据模型
@interface PictureModel : NSObject

// 创建日期
@property (nonatomic, strong) NSString *date;
// 内容
@property (nonatomic, strong) NSString *content;
// 图片路径
@property (nonatomic, strong) NSString *picture;

@end
