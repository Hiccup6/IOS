

#import <Foundation/Foundation.h>
// 文本编辑用到的数据模型
@interface TextModel : NSObject

// 创建日期
@property (nonatomic, strong) NSString *date;
// 标题
@property (nonatomic, strong) NSString *title;
// 简介
@property (nonatomic, strong) NSString *text;
// 所有内容
@property (nonatomic, strong) NSString *allContent;

/* textPostCell 的高度 */
@property (nonatomic, assign, readonly) CGFloat textH;
@property (nonatomic, assign, readonly) CGFloat textPostCellHeight;

@end
