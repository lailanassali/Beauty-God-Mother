//
//  ProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 25/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var displayNameText: UILabel!
    
    var databaseRef: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        databaseRef = Database.database().reference()
        
        if let userID = Auth.auth().currentUser?.uid{
           
            databaseRef.child("profile").child(userID).observeSingleEvent(of: .value, with:{ (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
            
                let username = dictionary?["username"] as? String ?? "usernane"
            
           
         
        }
        
       ) }
    

}
}
