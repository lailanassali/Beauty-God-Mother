//
//  AccountViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import FirebaseAuth


class AccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

<<<<<<< HEAD
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
=======
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
>>>>>>> 6c7f9f96a3dc0a52eeda7b3bcf0619ddcc94ef64
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


