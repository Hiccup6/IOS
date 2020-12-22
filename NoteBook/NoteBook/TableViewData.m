
#import "TableViewData.h"
#import "TextModel.h"
#import "PictureModel.h"
#import "CustomModel.h"
// 用于保存与处理项目中用到的数据。读取配置文件，返回相应数据给TableViewCell
@implementation TableViewData

+ (id)loadTextData
{
    NSString *configPath = [NSString stringWithFormat:@"%@/textConfig.txt", [FileManager dirLib]];
    NSString *configContent = [FileManager readFile:configPath];
    
    if (![FileManager isExitsFile:configPath])  return configContent;
    
    NSMutableArray *configMArr = [[NSMutableArray alloc] init];
    NSArray *configArr = [configContent componentsSeparatedByString:atricleSpe];
    for (int i = 0; i < configArr.count - 1; i ++) {
        NSArray *itemArr = [configArr[i] componentsSeparatedByString:itemSpe];
        TextModel *textModel = [[TextModel alloc] init];

        textModel.title = itemArr[1];
        
        textModel.date = itemArr[0];
        
        textModel.text = itemArr[2];
        
        NSString *allCotentFormater = [itemArr[0] substringFromIndex:9];
        NSString *newFilePath = [NSString stringWithFormat:@"%@/%@.txt", [FileManager dirLibCache], allCotentFormater];
        textModel.allContent = [FileManager readFile:newFilePath];
        
        [configMArr insertObject:textModel atIndex:configMArr.count];
    }
   
    return configMArr;
    
}


+ (id)loadPictureData
{
    //直接读取配置文件
    NSString *configPath = [NSString stringWithFormat:@"%@/pictureConfig.txt", [FileManager dirLib]];
    NSString *configContent = [FileManager readFile:configPath];
    
    if (![FileManager isExitsFile:configPath]) return configContent;
    
    NSMutableArray *configMArr = [[NSMutableArray alloc] init];
    NSArray *configArr = [configContent componentsSeparatedByString:atricleSpe];
    for (int i = 0; i < configArr.count - 1; i ++) {
        
        NSArray *itemArr = [configArr[i] componentsSeparatedByString:itemSpe];
        
        PictureModel *pictureModel = [[PictureModel alloc] init];
        
        pictureModel.date = itemArr[0];
        pictureModel.picture = itemArr[1];
        pictureModel.content = itemArr[2];
        
        [configMArr insertObject:pictureModel atIndex:configMArr.count];
        
    }
    
    return configMArr;
}

+ (id)loadCustomData
{
    
    NSMutableArray *customMArr = [[NSMutableArray alloc] init];
    
    NSMutableArray *textMArr = [TableViewData loadTextData];
    for (TextModel *model in textMArr) {
        
        CustomModel *customModel = [[CustomModel alloc] init];

        if (model.title != nil) {
            
            customModel.title = [model.title substringFromIndex:10];
        }else{
            customModel.title = [model.date substringFromIndex:9];
        }
        
        customModel.content = [model.text substringFromIndex:12];
        customModel.customCellH = model.textPostCellHeight;
        
        [customMArr insertObject:customModel atIndex:customMArr.count];
    }
    
    
    NSMutableArray *pictureMArr = [TableViewData loadPictureData];
    for (PictureModel *model in pictureMArr) {
        
        CustomModel *customModel = [[CustomModel alloc] init];
        
        customModel.title = [model.date substringFromIndex:9];
        customModel.content = [model.content substringFromIndex:12];
        customModel.picture = model.picture;
        customModel.customCellH = pictureListCellH;
        
        [customMArr insertObject:customModel atIndex:customMArr.count];
    }
    
    return customMArr;
}

@end
