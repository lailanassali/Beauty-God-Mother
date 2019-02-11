//
//  ProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 25/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth



class ProfileViewController: UIViewController {
    
   
    @IBOutlet weak var orgname_label: UILabel!
    var organisation: String?
    
    
    override func viewDidLoad (){
        super.viewDidLoad()
        
        checkIfUserIsLoggedIn()
        
       }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(logout_TouchUpInside), with: nil,
                            afterDelay: 0)
        } else {
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("providers").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                self.navigationItem.title = dictionary["organisation"] as? String
                }
                
            }, withCancel: nil)
        }
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
