//
//  ServicesViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/25/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ServicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var databaseRef = FIRDatabase.database().reference()
    var loggedInProvider = AnyObject?()
    var loggedInProvider = AnyObject?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loggedInProvider = FIRAuth()?.currentUser
        
        self.databaseRef.child("users").child(self.loggedInProvider!.uid).observeSingleEventOfType(.Value) { (snapshot:FIRDataSnapshot) in
            
            self.loggedInProviderData = snapshot
            self.databaseRef.child("Service/\(self.loggedInProvider!.uid)").observeSingleEventOfType(.ChildAdded, withBlock: {(snapshot: FIRDataSnapshot) in
                
                self.services.append(snapshot)
                
                self.serviceTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection:0)], withRowAnimation:
                UITableViewRowAnimation.Automatic)
                
            }) {(error) in
                
                print(error.localizedDescription)
            }
        }
    }
}
