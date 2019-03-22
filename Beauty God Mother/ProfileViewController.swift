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

    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var companytype: UILabel!
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    var loggedInUser: AnyObject? = .none
    var databaseRef = Database.database().reference()
    var storageRef = Storage.storage().reference()
    
   
    @IBOutlet weak var servicesContainer: UIView!
    @IBOutlet weak var mediaContainer: UIView!
    @IBOutlet weak var reviewsContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loggedInUser = Auth.auth().currentUser
        self.databaseRef.child("users").child(self.loggedInUser!.uid).observeSingleEvent(of: .value) { (snapshot:DataSnapshot)in
            
            
            self.businessName.text = ((snapshot.value as? NSDictionary)? ["organisation name"] as! String)
            self.bio.text = ((snapshot.value as? NSDictionary)? ["bio"] as! String)
            self.companytype.text = ((snapshot.value as? NSDictionary)? ["companytype"] as! String)

            }
        
        }
        
    }
    

    

