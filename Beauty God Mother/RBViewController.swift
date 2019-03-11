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
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var rs = RegistrationService.shared
    
    var isEnabled = true
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func registerPressed(_ sender: Any) {
            handleRegister()
    
    }

    @IBAction func goBackToLogin(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    public func handleRegister() {
        
        // Stage 1
        guard let name = name.text, let email = emailTF.text, let password = passwordTF.text, let confirmPassword = confirmPasswordTF.text else {return}
       // Stage 2
        if !rs.passwordMatches(p1: password, p2: confirmPassword) || !rs.nameFormatIsCorrect(name: name) || !rs.fieldsAreNotEmpty(name: name, p1: password, p2: confirmPassword, email: email) { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (result:AuthDataResult?, error) in
            if let error = error {
                print("Failed to create User:",error)
                return
            }
            
//             Save id generated by Firebase
            guard let uid = result?.user.uid else {return}
            
            // Database Structure
            let dictionaryValues = ["name": name,
                                    "email": email,
                                    "kind": "customer"]
            // Save values to uid
            let values = [uid:dictionaryValues]
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if let err = error {
                    print("Failed to save user to database:",err)
                    return
                }
                
                print("Sucessfully added \(name) to database!")
                self.performSegue(withIdentifier: "buyerToConfirmation", sender: self)
            })
        }
    }
    
    func createAlertForFieldConstraints(title:String, message:String) {
        
        let alert = UIAlertController.init(title: "title", message: "message", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
  
}
