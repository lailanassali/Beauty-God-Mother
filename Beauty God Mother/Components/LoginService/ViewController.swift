//
//  ViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    //MARK: - IBOUTLETS

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var placeHolder = NSMutableAttributedString()
    
    var ls = LoginService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        // step 1
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        
        // step 2
        if !ls.fieldsShouldNotBeEmpty(email: email, password: password) { return }
        
        // step 2 
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let e = error {
                
                let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                let alert = UIAlertController(title: "Sorry, you have entered an invalid email or password!", message: "Please try again.", preferredStyle: .alert)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil) 
                
                print("Failed to log user in: ",e)
                return
            }
           self.present(RootViewController(), animated: true, completion: nil)
        }
    }
}


