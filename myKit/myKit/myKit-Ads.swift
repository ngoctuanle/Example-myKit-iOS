//
//  myKit-Ads.swift
//  myKit
//
//  Created by Tuan Le on 6/27/16.
//  Copyright © 2016 Tuan Le. All rights reserved.
//

import Foundation
import GoogleMobileAds

public class myK_AdsBannerView: GADBannerView {
    public convenience init(adUnitID: String, rootViewController: UIViewController){
        self.init(adSize: kGADAdSizeSmartBannerPortrait)
        self.adUnitID = adUnitID
        self.rootViewController = rootViewController
        //request.testDevices = [ kGADSimulatorID ]
        self.loadRequest(GADRequest())
    }
}

public class myK_AdsInterstitialView:GADInterstitial{
    public override init(adUnitID: String){
        super.init(adUnitID: adUnitID)
        self.loadRequest(GADRequest())
    }
}
