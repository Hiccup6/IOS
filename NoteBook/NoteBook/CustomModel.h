

#import <Foundation/Foundation.h>
// 展示搜索结果中用到的数据模型
@interface CustomModel : NSObject

// 标题 (date)
@property (nonatomic, strong) NSString *title;
// 内容 (text / todo)
@property (nonatomic, strong) NSString *content;
// 图片路径 (picture)
@property (nonatomic, strong) NSString *picture;

/* customShowCell 的高度 */
@property (nonatomic, assign) CGFloat customCellH;

@end
