//
//  CustomerTabBar.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class CustomerTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()

        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // search
        let searchVC = storyboard.instantiateViewController(withIdentifier: "MapVC")
        let searchNavigation = UINavigationController(rootViewController: searchVC)
        searchVC.title = "Search"
        
        let accountVC = storyboard.instantiateViewController(withIdentifier: "AccountVC")
        let accountNavigation = UINavigationController(rootViewController: accountVC)
        accountVC.title = "My Account"
        
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC")
        let contactNavigation = UINavigationController(rootViewController: contactVC)
        contactVC.title = "Contact"
        
        
        
        viewControllers = [searchNavigation, accountNavigation, contactNavigation]
    }

  

}
