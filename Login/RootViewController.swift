//
//  RootViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase

class RootViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        if let uid = Auth.auth().currentUser?.uid {
            fetchCurrentUser(withID: uid)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginPageID")
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    
    fileprivate func fetchCurrentUser(withID id: String) {
        Database.fetchUserWithUID(uid: id) { (user) in
            if user.kind == .provider {
                self.present(ProviderTabBar(), animated: true, completion: nil)
            } else {
                self.present(CustomerTabBar(), animated: true, completion: nil)
            }
        }
    }
}
