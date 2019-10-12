//
//  LYSGoogleAd.h
//  Pods
//
//  Created by 刘永生 on 2017/3/4.
//
//

#import <Foundation/Foundation.h>


@interface LYSGoogleAd : NSObject

+ (LYSGoogleAd *)shareInstance;


/**
 横幅广告的广告id

 @param unitID 广告id
 */
+ (void)lys_adBannerUnitID:(NSString *)unitID;


/**
 显示横幅广告

 @param vc 视图
 */
+ (void)lys_showGadBannerVC:(UIViewController *)vc;



/**
 插页广告的广告id

 @param unitID 广告id
 */
+ (void)lys_adInterstitialUnitID:(NSString *)unitID;

+ (void)lys_showInterstitialVC:(UIViewController *)vc;


@end
