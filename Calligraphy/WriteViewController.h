//
//  WriteViewController.h
//  Calligraphy
//
//  Created by 刘永生 on 15/8/26.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataItem;

@interface WriteViewController : UIViewController

+ (void)showWriteViewDelegate:(id)aDelegate dataItem:(DataItem *)aItem;

@end
