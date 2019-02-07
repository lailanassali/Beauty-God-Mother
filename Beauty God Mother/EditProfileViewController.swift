//
//  EditProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 06/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class EditProfileViewController: UIViewController {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    
   // var databaseRef: DatabaseReference!
    var storageRef: StorageReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     //   databaseRef = Database.database().reference()
        storageRef = Storage.storage().reference()
        
      //  loadProfileData()

    }
    
   /* func loadProfileData(){
    //    if let userID = Auth.auth().currentUser?.uid{
    //        databaseRef.child("profile").child(userID).observe(.value, with: { (snapshot) in
                
            let values = snapshot.value as? NSDictionary
                
                if let profileImageURL = values?["photo"] as? String{
                    self.profilePictureImageView.sd_setImage(with: URL(string: profileImageURL))
                }
                
       //     })
        }
   // } */
    

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseProfileButtonTapped(_ sender: Any) {
    }
    
    @IBOutlet var saveButtonTapped: UIView!
}
