//
//  ContactViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 19/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

       override func viewDidLoad() {
        super.viewDidLoad()
   }
    
    @IBAction func openTwiterPage(_ sender: Any) {
        
        let screenName = "bgm_app"
        let appURL = NSURL(string:"twitter://user?screen_name=\(screenName)")!
        let webURL = NSURL(string: "https://twitter.com/\(screenName)")!
        
        if UIApplication.shared.canOpenURL(appURL as URL){
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL as URL)
            }
        } else {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(webURL as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.canOpenURL(webURL as URL)
        }
    }
}
    
    @IBAction func openInstaPage(_ sender: Any) {
      
        let screenName = "beautygodmother_"
        let appURL = NSURL(string:"instagram://user?screen_name=\(screenName)")!
        let webURL = NSURL(string: "https://instagram.com/\(screenName)")!
        
        if UIApplication.shared.canOpenURL(appURL as URL){
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL as URL)
            }
        } else {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(webURL as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.canOpenURL(webURL as URL)
            }
        }
    }
    
    @IBAction func sendFeedbackEmail(_ sender: Any) {
        let email = "beautygodmother@gmail.com"
        if let url = URL(string: "mailto:\(email)"){
            if #available(iOS 10.0, *){
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
