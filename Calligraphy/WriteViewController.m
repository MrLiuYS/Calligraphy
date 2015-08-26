//
//  WriteViewController.m
//  Calligraphy
//
//  Created by 刘永生 on 15/8/26.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "WriteViewController.h"
#import <UIImageView+WebCache.h>
#import <MZFormSheetController.h>
#import <ACEDrawingView.h>

#import "DataItem.h"

@interface WriteViewController ()<ACEDrawingViewDelegate> {
    
    
    __weak IBOutlet UIImageView *bgWriteImageView;
    
    __weak IBOutlet ACEDrawingView *drawView;
    
    
}

@property (nonatomic, strong) DataItem * mDataItem;


@end

@implementation WriteViewController


+ (void)showWriteViewDelegate:(id)aDelegate dataItem:(DataItem *)aItem{
    
    WriteViewController * ctrl = [[WriteViewController alloc]initWithNibName:@"WriteViewController" bundle:nil];
    
    ctrl.mDataItem = aItem;
    
    MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:ctrl];
    
    formSheet.presentedFormSheetSize = CGSizeMake(ScreenWidth - 40, ScreenWidth - 40 + 45);
    //    formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromTop;
    
    formSheet.shadowRadius = 0.0;
    formSheet.shadowOpacity = 0.0;
    formSheet.shouldDismissOnBackgroundViewTap = YES;
    formSheet.shouldCenterVertically = YES;
    formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
    
    
    [aDelegate mz_presentFormSheetController:formSheet animated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        
    }];
    
}

#pragma mark - 粗细
- (IBAction)touchThickness:(id)sender {
    
    drawView.lineWidth = 1;
    
}

#pragma mark - 颜色
- (IBAction)touchColor:(id)sender {
    
    
    
    
}

#pragma mark - 清除
- (IBAction)touchClear:(id)sender {
    [drawView clear];
}

//完成
- (IBAction)touchCancel:(id)sender {
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    drawView.delegate = self;
    
    drawView.lineColor = [UIColor redColor];
    
    [bgWriteImageView sd_setImageWithURL:[NSURL URLWithString:_mDataItem.imgurlstr] placeholderImage:nil];
    
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
