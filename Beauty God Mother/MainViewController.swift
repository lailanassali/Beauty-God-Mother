//
//  MainViewController.swift
//  Beauty God Mother
//
//  Created by Laila on 13/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    override func viewDidLoad() {
        checkIfUserIsLoggedIn()
    }
    @IBAction func handleLogout(_ sender: UIBarButtonItem) {
         logout()
    }
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0) {
                self.logout()
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "MainToLogin", sender: self)
        } catch let e {
            print("Failed to logout",e)
        }
    }
}

