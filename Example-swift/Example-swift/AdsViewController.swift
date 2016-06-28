//
//  AdsViewController.swift
//  Example-swift
//
//  Created by Tuan Le on 6/27/16.
//  Copyright © 2016 Tuan Le. All rights reserved.
//

import UIKit
import myKit

class AdsViewController: UIViewController {
    var interstitial: myK_AdsInterstitialView!
    @IBOutlet weak var bannerView: UIView!
    @IBAction func btnClick(sender: UIButton) {        
        if(interstitial.isReady){
            interstitial.presentFromRootViewController(self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        self.title = "Ads"
        
        let adsView = myK_AdsBannerView(adUnitID: "ca-app-pub-3940256099942544/2934735716", rootViewController: self)
        self.bannerView.addSubview(adsView)
        
        interstitial = myK_AdsInterstitialView(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
