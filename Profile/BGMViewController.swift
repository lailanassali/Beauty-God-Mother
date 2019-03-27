//
//  BGMViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/27/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ImageIO


class BGMViewController: UIViewController {
    
    
    //    @IBOutlet weak var servicesContainer: UIView!
  //  @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imge: UIImageView!
    //     @IBOutlet weak var reviewContainer: UIView!
   
    var image = ""
   // var companyName = ""
    
    
 
   //     @IBOutlet weak var mediaContainer: UIView!
  
        //  var loggedInUser: AnyObject? = .none
        // var databaseRef = Database.database().reference()
        // var storageRef = Storage.storage().reference()
        
        override func viewDidLoad (){
            super.viewDidLoad()
            
            imge.image = UIImage(named: image)
            
            
            
            
            
           
            
            // self.loggedInUser = Auth.auth().currentUser
            //self.databaseRef.child("providers").child(self.loggedInUser!.uid).observeSingleEvent(of: .value) {(snapshot:DataSnapshot)in
            
            
            // self.organisationName.text = ((snapshot.value as? NSDictionary)? ["organisationname"] as! String)
            //self.serviceType.text = ((snapshot.value as? NSDictionary)? ["companytype"] as? String)
            // self.bio.text = ((snapshot.value as? NSDictionary)? ["bio"] as? String)
            
        }
        
//        @IBAction func switchViews(_ sender: UISegmentedControl) {
//
//            if sender.selectedSegmentIndex == 0
//            {
//                servicesContainer.alpha = 1
//                reviewContainer.alpha = 0
//            } else {
//                servicesContainer.alpha = 0
//                reviewContainer.alpha = 1
//            }
//        }
    
        
    }
    

