//
//  ViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var placeHolder = NSMutableAttributedString()
    @IBOutlet weak var fieldsEmptyAlert: UILabel!
    @IBOutlet weak var emailNotExistAlert: UILabel!
    
    static var view = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.keyboardDismiss))
        
        view.addGestureRecognizer(tap)
        
        hideText()
    }

     @objc func keyboardDismiss(){
        view.endEditing(true)
    }
    
    func hideText() {
        fieldsEmptyAlert.isHidden = true
        emailNotExistAlert.isHidden = true
    }
    
    func fieldsShouldNotBeEmpty(email: String, password: String) -> Bool {
        if email.count != 0 && password.count != 0 {
            return true
        } else {
            fieldsEmptyAlert.isHidden = false
            return false
        }
    }
  
    @IBAction func loginPressed(_ sender: UIButton) {
      
        // step 1
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        
        // step 2
        if !fieldsShouldNotBeEmpty(email: email, password: password) { return }
        
        // step 3
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let e = error {
                
                self.emailNotExistAlert.isHidden = false
                
                print("Failed to log user in: ",e)
                return
            }
           self.present(RootViewController(), animated: true, completion: nil)
        }
    }
}


