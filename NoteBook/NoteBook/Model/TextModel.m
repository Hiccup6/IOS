

#import "TextModel.h"

@interface TextModel()
{
    CGFloat _textH;
    CGFloat _textPostCellHeight;
}

@end

@implementation TextModel

- (CGFloat)textH
{
    if (!_textH) {
        //计算文字的高度
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:20 weight:2];
        
        _textH = [self.allContent boundingRectWithSize:CGSizeMake(ZScreenW - 2 * cellMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.height;
    }
    return _textH;
}

- (CGFloat)textPostCellHeight
{
    if (!_textPostCellHeight) {
        
        _textPostCellHeight = self.textH + 50 + cellMargin;
    }
    
    return _textPostCellHeight;
}

@end
