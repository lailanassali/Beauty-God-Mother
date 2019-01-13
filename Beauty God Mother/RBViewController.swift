//
//  RBViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RBViewController: UIViewController {
    
    //MARK: - IB0UTLETS
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
   
     var message = ""
    
    var isEnabled = true
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func registerPressed(_ sender: Any) {
        _ = verifyPasswords(p1: passwordTF.text ?? "",p2: confirmPasswordTF.text ?? "")
        
        
        
        
        
    }

    func verifyPasswords (p1:String, p2:String) -> Bool {
        if p1 == p2 {
            handleRegister()
            return true
        } else {return false}
    }
    @IBAction func goBackToLogin(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    public func handleRegister() {
        message = "match"
        guard let name = name.text, let username = usernameTF.text, let email = emailTF.text, let password = passwordTF.text, let confirmPassword = confirmPasswordTF.text else {return}
        Auth.auth().createUser(withEmail: email, password: password) { (result:AuthDataResult?, error) in
            if let error = error {
                print("Failed to create User:",error)
                return
            }
            
//             Save id generated by Firebase
            guard let uid = result?.user.uid else {return}
            
            // Database Structure
            let dictionaryValues = ["name": name,
                                    "username": username,
                                    "email": email]
            // Save values to uid
            let values = [uid:dictionaryValues]
            Database.database().reference().child("customers").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if let err = error {
                    print("Failed to save user to database:",err)
                    return
                }
                
                print("Sucessfully added \(username) to database!")
                self.performSegue(withIdentifier: "buyerToConfirmation", sender: self)
            })
        }
        
    }
    
    // need to find a way to test this method, fake register db to test around it :/
    
}
