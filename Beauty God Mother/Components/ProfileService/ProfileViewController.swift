//
//  ProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 25/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit
import FirebaseAuth


class ProfileViewController: UIViewController {
    override func viewDidLoad (){
        super.viewDidLoad()
       }
    
    @IBAction func logout_TouchUpInside(_ sender: Any) {
        
        do {
       try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let signInVC = storyboard.instantiateViewController(withIdentifier: "LoginPageID")
        self.present(signInVC, animated: true, completion: nil)
    }
}
