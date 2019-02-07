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
        let buttonArray = [registerAsSP, registerAsBuyer]
        
        for i in buttonArray {
            i?.layer.cornerRadius = 24
            i?.layer.shadowOffset = CGSize(width: 0, height: 15)
            i?.layer.shadowRadius = 15
            i?.layer.borderColor = #colorLiteral(red: 0.2370404005, green: 0.7025367618, blue: 0.6212409139, alpha: 1)
            i?.layer.borderWidth = 2
        }
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let e = error {
                print("Failed to log user in: ",e)
                return
            }
            
            
     self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
    

}

