//
//  AccountViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import FirebaseAuth


class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutTapped(_ sender: Any) {
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


