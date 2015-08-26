//
//  WriteViewController.m
//  Calligraphy
//
//  Created by 刘永生 on 15/8/26.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "WriteViewController.h"

#import <MZFormSheetController.h>
#import "DataItem.h"

@interface WriteViewController ()

@end

@implementation WriteViewController


+ (void)showWriteViewDelegate:(id)aDelegate dataItem:(DataItem *)aItem{
    
    WriteViewController * ctrl = [[WriteViewController alloc]initWithNibName:@"WriteViewController" bundle:nil];
    
    MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:ctrl];
    
    formSheet.presentedFormSheetSize = CGSizeMake(300, 370);
    //    formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromTop;
    formSheet.shadowRadius = 2.0;
    formSheet.shadowOpacity = 0.3;
    formSheet.shouldDismissOnBackgroundViewTap = YES;
    formSheet.shouldCenterVertically = YES;
    formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
    
    
    [aDelegate mz_presentFormSheetController:formSheet animated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        
    }];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
