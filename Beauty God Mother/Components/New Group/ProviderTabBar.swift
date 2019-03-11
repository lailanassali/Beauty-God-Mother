//
//  ProviderTabBar.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ProviderTabBar: UITabBarController, UITabBarControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabBar()

        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // search
        let searchVC = storyboard.instantiateViewController(withIdentifier: "MapVC")
        let searchNavigation = UINavigationController(rootViewController: searchVC)
        searchVC.title = "Search"
        // account
        let accountVC = UIViewController()
        let accountNavigation = UINavigationController(rootViewController: accountVC)
<<<<<<< HEAD
        accountVC.title = "My Account"
        // profile
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC")
        let profileNavigation = UINavigationController(rootViewController: profileVC)
        profileVC.title = "Profile"
        //contact page 
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC")
        let contactNavigation = UINavigationController(rootViewController: contactVC)
        accountVC.title = "Contact "
        
        viewControllers = [searchNavigation, accountNavigation, profileNavigation, contactNavigation]
=======
        accountVC.title = "Account"
        
        viewControllers = [searchNavigation, profileNavigation, accountNavigation]
>>>>>>> develop
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
