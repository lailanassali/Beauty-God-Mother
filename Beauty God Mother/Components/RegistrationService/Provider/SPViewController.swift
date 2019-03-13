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
    
    @IBAction func nextPressed(_ sender: Any) {
        handleNext()
    }
    
    
    public func handleNext() {
        // stage 1
        guard let name = organisation.text, let email = email.text, let password = password.text, let confirmPassword = confirmPassword.text else {return}
        
        // stage 2
        if !rs.passwordMatches(p1: password, p2: confirmPassword) || !rs.nameFormatIsCorrect(name: name) || !rs.fieldsAreNotEmpty(name: name, p1: password, p2: confirmPassword, email: email) { return }
        // save details to registration service
        rs.name = name
        rs.email = email
        rs.password = password
        

        
        let controller = storyboard!.instantiateViewController(withIdentifier: "StartVC")
        self.present(controller, animated: true, completion: nil)
        
    }
}
        
public let storyboard = UIStoryboard(name: "Main", bundle: nil)
