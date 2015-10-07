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
#import <PopoverView.h>
#import "DataItem.h"

@interface WriteViewController ()<ACEDrawingViewDelegate,PopoverViewDelegate> {
    
    
    __weak IBOutlet UIImageView *bgWriteImageView;
    
    __weak IBOutlet ACEDrawingView *drawView;
    
    
    IBOutlet UIView *colorView;
    
    __weak IBOutlet UILabel *colorLabelR;
    __weak IBOutlet UISlider *colorSliderR;
    
    __weak IBOutlet UILabel *colorLabelG;
    __weak IBOutlet UISlider *colorSliderG;
    
    __weak IBOutlet UILabel *colorLabelB;
    __weak IBOutlet UISlider *colorSliderB;
    __weak IBOutlet UIView *colorCurrentView;
    
    
    IBOutlet UIView *lineView;
    
    __weak IBOutlet UISlider *lineSlider;
    
    __weak IBOutlet UILabel *smallLabel;
    
}

@property (nonatomic, strong) DataItem * mDataItem;


@end

@implementation WriteViewController


+ (void)showWriteViewDelegate:(id)aDelegate dataItem:(DataItem *)aItem{
    
    WriteViewController * ctrl = [[WriteViewController alloc]initWithNibName:@"WriteViewController" bundle:nil];
    
    ctrl.mDataItem = aItem;
    
    MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:ctrl];
    
    float height = MIN(((UIViewController*)aDelegate).view.frame.size.width, ((UIViewController*)aDelegate).view.frame.size.height);
    
    formSheet.presentedFormSheetSize = CGSizeMake(height - 50, height - 50 + 45);
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
- (IBAction)touchThickness:(UIButton *)sender {
    
    [PopoverView showPopoverAtPoint:sender.center
                             inView:self.view
                    withContentView:lineView
                           delegate:self];
    
}

#pragma mark - 颜色
- (IBAction)touchColor:(UIButton *)sender {
    
    [PopoverView showPopoverAtPoint:sender.center
                             inView:self.view
                    withContentView:colorView
                           delegate:self];
    
    
}
- (IBAction)changeSlider:(UISlider *)sender {
    
    if (sender == colorSliderR) {
        
        colorSliderR.minimumTrackTintColor = colorLabelR.textColor = colorSliderR.thumbTintColor = [UIColor colorWithRed:sender.value green:0 blue:0 alpha:1];
    }
    else if (sender == colorSliderG) {
        colorSliderG.minimumTrackTintColor = colorLabelG.textColor = colorSliderG.thumbTintColor = [UIColor colorWithRed:0 green:sender.value blue:0 alpha:1];
        
    }else if (sender == colorSliderB) {
        
        colorSliderB.minimumTrackTintColor = colorLabelB.textColor = colorSliderB.thumbTintColor = [UIColor colorWithRed:0 green:0 blue:sender.value alpha:1];
    }
    
    colorCurrentView.backgroundColor = drawView.lineColor = [UIColor colorWithRed:colorSliderR.value green:colorSliderG.value blue:colorSliderB.value alpha:1];

}

- (IBAction)changeLine:(UISlider *)sender {
    
    drawView.lineWidth = sender.value;
    
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
    
    [self changeSlider:colorSliderR];
    [self changeSlider:colorSliderG];
    [self changeSlider:colorSliderB];
    
    [self changeLine:lineSlider];
    
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
