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
        let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchVC")
        let searchNavigation = UINavigationController(rootViewController: searchVC)
        searchVC.title = "Search"
        // account
        let accountVC = storyboard.instantiateViewController(withIdentifier: "AccountVC")
        let accountNavigation = UINavigationController(rootViewController: accountVC)
        accountVC.title = "My Account"
        // profile
        let profileVC = storyboard.instantiateViewController(withIdentifier: "AdminProfileVC")
        let profileNavigation = UINavigationController(rootViewController: profileVC)
        profileVC.title = "Profile"
        //contact page
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC")
        let contactNavigation = UINavigationController(rootViewController: contactVC)
        accountVC.title = "Contact "
        
        viewControllers = [searchNavigation, accountNavigation, AdminprofileNavigation, contactNavigation]
        
        
    }
    
    
    
}
