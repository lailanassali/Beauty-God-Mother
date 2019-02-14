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

        // account
        let accountVC = UIViewController()
        let accountNavigation = UINavigationController(rootViewController: accountVC)
        accountVC.title = "Account"
        
        viewControllers = [searchNavigation, accountNavigation]
    }

  

}
