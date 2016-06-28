//
//  SocialNetworkViewController.swift
//  Example-swift
//
//  Created by Tuan Le on 6/27/16.
//  Copyright © 2016 Tuan Le. All rights reserved.
//

import UIKit
import myKit
import FBSDKLoginKit
import FBSDKCoreKit

class SocialNetworkViewController: UIViewController {
    @IBOutlet weak var btnLoginFB: UILabel!
    @IBOutlet weak var pro5Pic: FBSDKProfilePictureView!
    @IBAction func btnFBClick(sender: UIButton) {
        let login = FBSDKLoginManager()
        if(FBSDKAccessToken.currentAccessToken() == nil){
            login.logInWithReadPermissions(["public_profile"], fromViewController: self, handler: {
                (result : FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
                if(error != nil){
                    print(error.localizedDescription)
                } else if (result.isCancelled){
                    print("Cancel")
                } else {
                    print("Logged in...")
                }
            })
        } else {
            let alertController = UIAlertController(title: "", message: "Logged as \(FBSDKProfile.currentProfile().name)", preferredStyle: .ActionSheet)
            let actionOk = UIAlertAction(title: "Close",style: .Cancel,handler: nil)
            let actionLogout = UIAlertAction(title: "Logout", style: .Destructive, handler: {
                Void in
                login.logOut()
                self.btnLoginFB.text = "Login FB"
                print("Logout...")
            })
            alertController.addAction(actionLogout)
            alertController.addAction(actionOk)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pro5Pic.layer.cornerRadius = 40
        self.pro5Pic.clipsToBounds = true
        self.pro5Pic.layer.borderWidth = 1
        self.pro5Pic.layer.borderColor = UIColor.whiteColor().CGColor
        
        FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SocialNetworkViewController.observeProfileChange(_:)), name: FBSDKProfileDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SocialNetworkViewController.observeTokenChange(_:)), name: FBSDKAccessTokenDidChangeNotification, object: nil)
        if(FBSDKAccessToken.currentAccessToken() != nil){
            self.observeProfileChange(nil)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        self.title = "Social Network"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func observeProfileChange(notfication: NSNotification!) {
        if(FBSDKProfile.currentProfile() != nil){
            btnLoginFB.text = "\(FBSDKProfile.currentProfile().name)"
        }
    }
    
    func observeTokenChange(notfication: NSNotification!) {
        if(FBSDKAccessToken.currentAccessToken() == nil){
            btnLoginFB.text = "Login FB"
        }else {
            self.observeProfileChange(nil)
        }
    }
}
