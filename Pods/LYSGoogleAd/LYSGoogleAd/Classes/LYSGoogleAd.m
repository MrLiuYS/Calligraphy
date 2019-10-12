//
//  LYSGoogleAd.m
//  Pods
//
//  Created by 刘永生 on 2017/3/4.
//
//

#import "LYSGoogleAd.h"

#import <GoogleMobileAds/GoogleMobileAds.h>
#import <Masonry/Masonry.h>

@interface LYSGoogleAd () <GADBannerViewDelegate,GADInterstitialDelegate>

@property (strong, nonatomic) GADBannerView *gadBannerView;//admob


@property (nonatomic,copy) NSString *gadInterstitialUnitID;
@property (strong, nonatomic) GADInterstitial *gadInterstitial;

@end


@implementation LYSGoogleAd


+ (void)lys_adBannerUnitID:(NSString *)unitID {
    
    [LYSGoogleAd shareInstance].gadBannerView.adUnitID = unitID;
    
}
+ (void)lys_showGadBannerVC:(UIViewController *)vc {
    
    GADBannerView * banner = [LYSGoogleAd shareInstance].gadBannerView;
    
    if (![vc.view.subviews containsObject:banner]) {
        [vc.view addSubview:banner];
        
        [banner mas_makeConstraints:^(MASConstraintMaker *make){
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(320);
            make.centerX.mas_equalTo(vc.view.mas_centerX);
        }];
        
    }
    
    banner.rootViewController = vc;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[
                            kGADSimulatorID
                            ];
    [banner loadRequest:request];
}

+ (void)lys_adInterstitialUnitID:(NSString *)unitID {
    
    [LYSGoogleAd shareInstance].gadInterstitialUnitID = unitID;
    
    [[LYSGoogleAd shareInstance] gadInterstitial];
    
}
+ (void)lys_showInterstitialVC:(UIViewController *)vc {
    
    GADInterstitial * gad = [LYSGoogleAd shareInstance].gadInterstitial;
    if (gad) {
        if ([gad isReady]) {
            [gad presentFromRootViewController:vc];
        }
    }
}


+ (LYSGoogleAd *)shareInstance {
    static LYSGoogleAd *__singletion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __singletion=[[self alloc] init];
        
    });
    return __singletion;
}




- (GADBannerView *)gadBannerView {
    if (!_gadBannerView) {
        _gadBannerView = [[GADBannerView alloc]
                          initWithFrame:CGRectMake(0,
                                                   0, 320, 50)];
    }
    return _gadBannerView;
}


- (GADInterstitial *)gadInterstitial {

    if (!_gadInterstitial && self.gadInterstitialUnitID) {
        _gadInterstitial = [[GADInterstitial alloc] initWithAdUnitID:self.gadInterstitialUnitID];
        _gadInterstitial.delegate = self;
        GADRequest *request = [GADRequest request];
        request.testDevices = @[
                                kGADSimulatorID
                                ];
        [_gadInterstitial loadRequest:request];
    }
    
    return _gadInterstitial;
}


@end
