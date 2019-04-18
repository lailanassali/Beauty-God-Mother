//
//  ForgotPassword.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 12/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase


class ForgotPassword: UIViewController {

    @IBOutlet weak var EmailInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.keyboardDismiss))
        
        view.addGestureRecognizer(tap)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }
    @objc func keyboardDismiss(){
        view.endEditing(true)
    }
    
    @IBAction func ResetButton(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: self.EmailInputField.text!) { (err) in
            if err == nil{
                self.navigationController?.popViewController(animated: true)
            }else{
                print(err?.localizedDescription)
            }
        }
    }
    
    @IBAction func CancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    var auth = FirebaseApp.auth();
//    var emailAddress = "user@example.com";
    
//    auth.forgotPassword(emailAddress).then(function() {
//    // Email sent.
//    }).catch(function(error) {
    // An error happened.
//    });
}
