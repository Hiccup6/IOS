

#import "PictureEditViewController.h"
// 图文记事的编辑视图控制器
@interface PictureEditViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation PictureEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    [self setupView];
}

- (void)setNav
{
    //上导航栏标题
    self.navigationItem.title = @"图文记事";
    // 保存并返回
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveAndBack)];
    // 按钮颜色
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:1]];
}
// 保存并返回
- (void)saveAndBack
{
    [self saveToFile];
    // 返回上一层
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// 保存为文件
- (void)saveToFile
{
    // 设置文件保存时间
    
    // 格式化NSData对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"]; // 时间格式为年月日时分秒
    NSString *fileDate = [formatter stringFromDate:[NSDate date]];//[NSDate date]表示当下时间
    
    //将图片转成NSData
    NSData *imgData = UIImageJPEGRepresentation(self.imgView.image, 1.0); // 传入图片和压缩系数
    
    //保存图片
    NSString *cachePath = [FileManager dirLibCache]; // 获取到文件目录
    NSString *picturePath =[NSString stringWithFormat:@"%@/%@.png", cachePath, fileDate]; //
    [imgData writeToFile:picturePath atomically:YES];
    
    //生成配置文件pictureConfig.txt
    NSString *configPath = [NSString stringWithFormat:@"%@/pictureConfig.txt", [FileManager dirLib]];
    NSString *configContent = @"";
    
    if (![FileManager isExitsFile:configPath])
        [FileManager writeFile:configPath content:@""];
    
    // 配置文件内容
    configContent = [NSString stringWithFormat:@"fileDate:%@%@filePath:%@.png%@fileContent:%@%@", fileDate, itemSpe, fileDate, itemSpe, self.textField.text, atricleSpe];
    
    //追加新项
    [FileManager updateFile:configPath newContent:configContent];
    
    //创建字典保存到数据库中
    NSDictionary *dataDic = @{@"date" : fileDate, @"content" : self.textField.text, @"picture" : fileDate };
    
    [[SQLiteManager sharedManager] insertData:dataDic intoTable:@
     "picture"];
    
}
// 图片编辑中间主界面
- (void)setupView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 定义添加图片按钮
    UIButton *addPictureBtn = [[UIButton alloc] init];
    addPictureBtn.titleLabel.font = [UIFont fontWithName:globalFont size:20];
    [addPictureBtn setTitle:@"添加图片" forState:UIControlStateNormal]; //设置文字常规状态显现
    [addPictureBtn setTitleColor:[UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:1] forState:UIControlStateNormal];
    [addPictureBtn addTarget:self action:@selector(addPicture) forControlEvents:UIControlEventTouchUpInside];
    // View上显示按钮
    [self.view addSubview:addPictureBtn];
    self.addPictureBtn = addPictureBtn;
    
    // 设置图片框
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.layer.shadowColor = [UIColor blackColor].CGColor;
    imgView.layer.shadowOffset = CGSizeMake(-2, -2);
//    imgView.layer.shadowOpacity = 0.5;
//    imgView.layer.shadowRadius = 10;
    imgView.layer.borderWidth = 5;
    imgView.layer.borderColor = [UIColor colorWithRed:57.0/255 green:139.0/255 blue:139.0/255 alpha:1].CGColor;
    [self.view addSubview:imgView];
    self.imgView = imgView;
    
    // 设置文本框
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"文字内容";
    [self.view addSubview:textField];
    self.textField = textField;
    
}
// 设置组件位置
- (void)viewDidLayoutSubviews
{
    self.addPictureBtn.frame = CGRectMake(ZScreenW * 0.3, cellMargin * 8, ZScreenW * 0.4, 30);
    self.imgView.frame = CGRectMake(cellMargin, self.addPictureBtn.y + self.addPictureBtn.height + cellMargin, ZScreenW - 2 * cellMargin, 250);
    self.textField.frame = CGRectMake(self.imgView.x, self.imgView.y + self.imgView.height + cellMargin, self.imgView.width, 30);
}

// 添加图片方法
- (void)addPicture
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleAlert];
    // 拍摄选项
    UIAlertAction *takePictureAction = [UIAlertAction actionWithTitle:@"拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self getPictureFromCamera];
        
    }];
    [alertVC addAction:takePictureAction];
    
    // 从本机获取
    UIAlertAction *imgAlbumAction = [UIAlertAction actionWithTitle:@"本机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self getPictureFromImgAlbum];
    }];
    [alertVC addAction:imgAlbumAction];
    
    // 取消
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:cancleAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)getPictureFromCamera
{
    //查看当前设备是否支持使用UIImagePickerController调用相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
       
        //设置拍照后的照片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        ZLog(@"模拟中...无法打开照相机，请在真机中使用!!!");
    }
    
}

// 从相册获取图片
- (void)getPictureFromImgAlbum
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    
    //设置选择后的图片可编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - <UIImagePickerControllerDelegate>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"]) {
        
        //拿到 并 添加 图片
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        [self dismissViewControllerAnimated:YES completion:^{
            self.imgView.image = image;
        }];
        
    }
}

@end
