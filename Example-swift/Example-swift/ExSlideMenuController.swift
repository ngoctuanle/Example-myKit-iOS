//
//  ExSlideMenuController.swift
//  Example-swift
//
//  Created by Tuan Le on 6/27/16.
//  Copyright © 2016 Tuan Le. All rights reserved.
//

import Foundation
import myKit
import UIKit

class ExSlideMenuController: SlideMenuController {
    override func isTagetViewController() -> Bool {
        if let vc = UIApplication.topViewController() {
            if vc is SocialNetworkViewController ||
                vc is AdsViewController ||
                vc is GameViewController ||
                vc is PurchaseViewController ||
                vc is NotiViewController{
                return true
            }
        }
        return false
    }
}