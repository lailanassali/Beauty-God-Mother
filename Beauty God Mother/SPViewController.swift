//
//  SPViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SPViewController: UIViewController {
    
    
    @IBOutlet weak var organisation: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    var rs = RegistrationService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    @IBAction func registerPressed(_ sender: Any) {
        handleRegister()
        
    }
    
    
    public func handleRegister() {
        // stage 1
        guard let organisation = organisation.text, let email = email.text, let password = password.text, let confirmPassword = confirmPassword.text else {return}
        
        // stage 2
        if !rs.passwordMatches(p1: password, p2: confirmPassword, viewController: self) || !rs.nameFormatIsCorrect(name: organisation, viewController: self) || !rs.fieldsAreNotEmpty(name: organisation, p1: password, p2: confirmPassword, email: email, viewController: self) { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (result:AuthDataResult?, error) in
            if let error = error {
                print("Failed to create User:",error)
                return
            }
            
            //             Save id generated by Firebase
            guard let uid = result?.user.uid else {return}
            
            // Database Structure
            let dictionaryValues = [
                                "organisation": organisation,
                                    "email": email,
                                    "kind": "provider"]
            // Save values to uid
            let values = [uid:dictionaryValues]
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if let err = error {
                    print("Failed to save user to database:",err)
                    return
                }
                
                print("Sucessfully added \(organisation) to database!")
                self.present(RootViewController(), animated: true, completion: nil)
            })
        }
    }
}
        

