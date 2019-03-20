//
//  AppDelegate.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
     //   let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //  let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginPageID")
   //     print(Auth.auth().currentUser?.uid)
        if let _ = Auth.auth().currentUser?.uid {
            window?.rootViewController = RootViewController()
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginPageID")
            window?.rootViewController = loginVC
        }

       //change colour of tab bar items
//        UITabBar.appearance().tintColor = .yellow
        return true
    }
    


   
}


