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
import FirebaseDatabase
import FirebaseStorage
import ImageIO


class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var organisationName: UILabel!
    @IBOutlet weak var serviceType: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    
    @IBOutlet weak var servicesContainer: UIView!
    @IBOutlet weak var mediaContainer: UIView!
    @IBOutlet weak var reviewContainer: UIView!
    
    var loggedInUser: AnyObject? = .none
    var databaseRef = Database.database().reference()
    var storageRef = Storage.storage().reference()
    
    override func viewDidLoad (){
        super.viewDidLoad()
    
        self.loggedInUser = Auth.auth().currentUser
        self.databaseRef.child("providers").child(self.loggedInUser!.uid).observeSingleEvent(of: .value) {(snapshot:DataSnapshot)in
            
            
           // self.organisationName.text = ((snapshot.value as? NSDictionary)? ["organisationname"] as! String)
            //self.serviceType.text = ((snapshot.value as? NSDictionary)? ["companytype"] as? String)
            self.bio.text = ((snapshot.value as? NSDictionary)? ["bio"] as? String)

        }
    }
    
    
    @IBAction func showComponents(_ sender: AnyObject) {
        
        if((sender as AnyObject).selectedSegmentIndex == 0)
        {
            UIView.animate(withDuration: 0.5, animations : {
                
                self.servicesContainer.alpha = 1
                self.mediaContainer.alpha = 0
                self.reviewContainer.alpha = 0
            })
        }
        else if((sender as AnyObject).selectedSegmentIndex == 1 )
        {
            UIView.animate(withDuration: 0.5, animations : {
                
                self.servicesContainer.alpha = 1
                self.mediaContainer.alpha = 0
                self.reviewContainer.alpha = 0
        })
    }
        else
    {
        UIView.animate(withDuration: 0.5, animations : {
            
            self.servicesContainer.alpha = 1
            self.mediaContainer.alpha = 0
            self.reviewContainer.alpha = 0
            
    })
        }
    }
}


