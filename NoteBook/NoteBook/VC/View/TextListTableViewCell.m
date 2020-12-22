

#import "TextListTableViewCell.h"
#import "TextModel.h"

@implementation TextListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont fontWithName:globalFont size:30];
    titleLab.textColor = [UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:1];
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    
    UILabel *dateLab = [[UILabel alloc] init];
    dateLab.font = [UIFont fontWithName:globalFont size:16];
    dateLab.textColor = [UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:1];
    [self.contentView addSubview:dateLab];
    self.dateLab = dateLab;
    
    UILabel *textLab = [[UILabel alloc] init];
    textLab.font = [UIFont fontWithName:globalFont size:28];
    [self.contentView addSubview:textLab];
    self.textLab = textLab;
}

- (void)setTextModel:(TextModel *)textModel
{
    _textModel = textModel;
    
    self.titleLab.text = [textModel.title substringFromIndex:10];
    
    NSString *dateFormater = [textModel.date substringFromIndex:9];
    
    if (dateFormater != nil)
    {
        NSRange yRange = {0, 4};
        NSRange MRange = {4, 2};
        NSRange dRange = {6, 2};
        
        dateFormater = [NSString stringWithFormat:@"%@.%@.%@", [dateFormater substringWithRange:yRange], [dateFormater substringWithRange:MRange], [dateFormater substringWithRange:dRange]];
        
        self.dateLab.text = dateFormater;
    }
    
    if (_textModel.allContent == nil) {
        
        self.textLab.hidden = YES;
        
  
    }else{
        self.textLab.text = [textModel.text substringFromIndex:12];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLab.frame = CGRectMake(cellMargin, cellMargin, 200, 25);
    self.dateLab.frame = CGRectMake(self.width - 100, cellMargin, 100, 25);
    self.textLab.frame = CGRectMake(cellMargin, 2 * cellMargin + self.titleLab.height, self.width - 2 * cellMargin, 25);

    
}


@end
