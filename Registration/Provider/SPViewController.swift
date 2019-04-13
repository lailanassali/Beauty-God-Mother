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
    @IBOutlet weak var nameFormatAlert: UILabel!
    @IBOutlet weak var passwordMatchAlert: UILabel!
    
    var rs = RegistrationService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameFormatAlert.isHidden = true
        passwordMatchAlert.isHidden = true
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        handleNext()
    }
    
    func nameFormatIsCorrect(name: String) -> Bool {
        if name.count <= 20 {
            return true
        } else {
            nameFormatAlert.isHidden = false
            return false }
    }
    
    func passwordMatches(password:String, confirmPassword:String) -> Bool {
        if password == confirmPassword {
            return true
        } else {
            passwordMatchAlert.isHidden = false
            return false
        }
    }
    
    public func handleNext() {
        // stage 1
        guard let name = organisation.text, let email = email.text, let password = password.text, let confirmPassword = confirmPassword.text else {return}
        
        // stage 2
        if passwordMatches(password: password, confirmPassword: confirmPassword) || nameFormatIsCorrect(name: name) || !rs.fieldsAreNotEmpty(name: name, password: confirmPassword, confirmPassword: confirmPassword, email: email) { return }
        // save details to registration service
        rs.name = name
        rs.email = email
        rs.password = password
        

        
        let controller = storyboard!.instantiateViewController(withIdentifier: "StartVC")
        self.present(controller, animated: true, completion: nil)
        
    }
}
        
public let storyboard = UIStoryboard(name: "Main", bundle: nil)
