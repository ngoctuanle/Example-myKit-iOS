//
//  MenuViewController.swift
//  Example-swift
//
//  Created by Tuan Le on 6/27/16.
//  Copyright © 2016 Tuan Le. All rights reserved.
//

import UIKit

enum SlideMenu: Int {
    case Social = 0
    case Ads
    case Game
    case Purchase
    case Noti
}

protocol SlideMenuProtocol: class {
    func changeViewController(menu: SlideMenu)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var menus = ["Social Network", "Ads", "Game Center", "In-app Purchase", "Notification"]
    
    var SocialView: UIViewController!
    var AdsView: UIViewController!
    var GameView: UIViewController!
    var PurchaseView: UIViewController!
    var NotiView: UIViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let SocialView = storyBoard.instantiateViewControllerWithIdentifier("SocialNetworkView") as! SocialNetworkViewController
        //self.SocialView = UINavigationController(rootViewController: SocialView)
        
        let AdsView = storyBoard.instantiateViewControllerWithIdentifier("AdsView") as! AdsViewController
        self.AdsView = UINavigationController(rootViewController: AdsView)
        
        let GameView = storyBoard.instantiateViewControllerWithIdentifier("GameView") as! GameViewController
        self.GameView = UINavigationController(rootViewController: GameView)
        
        let PurchaseView = storyBoard.instantiateViewControllerWithIdentifier("PurchaseView") as! PurchaseViewController
        self.PurchaseView = UINavigationController(rootViewController: PurchaseView)
        
        let NotiView = storyBoard.instantiateViewControllerWithIdentifier("NotiView") as! NotiViewController
        self.NotiView = UINavigationController(rootViewController: NotiView)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeViewController(menu: SlideMenu) {
        switch menu {
        case .Social:
            self.slideMenuController()?.changeMainViewController(self.SocialView, close: true)
        case .Ads:
            self.slideMenuController()?.changeMainViewController(self.AdsView, close: true)
        case .Game:
            self.slideMenuController()?.changeMainViewController(self.GameView, close: true)
        case .Purchase:
            self.slideMenuController()?.changeMainViewController(self.PurchaseView, close: true)
        case .Noti:
            self.slideMenuController()?.changeMainViewController(self.NotiView, close: true)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuTableViewCell
        cell.titleLabel.text = menus[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let menu = SlideMenu(rawValue: indexPath.item){
            self.changeViewController(menu)
        }
    }
    
}
