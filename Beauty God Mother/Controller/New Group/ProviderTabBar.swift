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
        // account
        let accountVC = storyboard.instantiateViewController(withIdentifier: "AccountVC")
        let accountNavigation = UINavigationController(rootViewController: accountVC)
        // profile
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC")
        let profileNavigation = UINavigationController(rootViewController: profileVC)
        //contact page
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC")
        let contactNavigation = UINavigationController(rootViewController: contactVC)
        
        viewControllers = [searchNavigation, accountNavigation, profileNavigation, contactNavigation]
        
        
    }
    
    
    
}
