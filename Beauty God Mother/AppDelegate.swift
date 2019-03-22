//
//  AppDelegate.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        STPPaymentConfiguration.shared().publishableKey = "pk_live_mYht3IyXFOk5Dk0n3IJ1dTMx00Wm77IrMq"
        
        // test this ^ integration

        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if let _ = Auth.auth().currentUser?.uid {
            window?.rootViewController = RootViewController()
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginPageID")
            window?.rootViewController = loginVC
        }
        
<<<<<<< HEAD
        

       //change colour of tab bar items
//        UITabBar.appearance().tintColor = .yellow
=======
>>>>>>> 47e31b8256b10a3a9717605a47827d8ab720b6a0
        return true
    }
}


