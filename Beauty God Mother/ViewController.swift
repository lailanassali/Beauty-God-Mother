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
   
    @IBOutlet weak var registerAsBuyer: UIButton!
    @IBOutlet weak var registerAsSP: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    fileprivate func setupViews() {
        _ = [registerAsSP, registerAsBuyer].map { (btn) in
            guard let btn = btn else {return}
            btn.layer.cornerRadius = 24
            btn.layer.shadowOffset = CGSize(width: 0, height: 15)
            btn.layer.shadowRadius = 15
            btn.layer.borderColor = #colorLiteral(red: 0.2370404005, green: 0.7025367618, blue: 0.6212409139, alpha: 1)
            btn.layer.borderWidth = 2
        }
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let e = error {
                
                let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                let alert = UIAlertController(title: "Sorry, please enter a valid username or password to continue!", message: "Please try again.", preferredStyle: .alert)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil) 
                
                print("Failed to log user in: ",e)
                return
            }
           self.present(RootViewController(), animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotPassowrd(_ sender: Any) {
        
        
    }
}

