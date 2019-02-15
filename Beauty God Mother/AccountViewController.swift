//
//  AccountViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage



class AccountViewController: UIViewController {

   
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var accountPic: UIImageView!
    
    var loggedInUser = AnyObject?()
    var databaseRef = Database.database().reference()
    var StorageRef = Storage.storage().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loggedInUser = FIRAuth.auth()?.currentUser
        
        self.databaseRef.child(

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


