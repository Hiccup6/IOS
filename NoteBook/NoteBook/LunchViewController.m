//
//  LunchViewController.m
//  NoteBook
//
//  Created by class on 2020/12/15.
//  Copyright © 2020年 ZXX. All rights reserved.
//

#import "LunchViewController.h"

@interface LunchViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *setupImg;


@end

@implementation LunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"text"];
    self.setupImg.image = img;
    CGRect orginFrame = self.setupImg.frame;
    orginFrame.origin.x = 0;
    orginFrame.origin.y = 0;
    self.setupImg.frame = orginFrame;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
