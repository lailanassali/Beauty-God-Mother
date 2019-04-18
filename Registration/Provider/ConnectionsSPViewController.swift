//
//  ConnectionsSPViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 26/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase

class ConnectionsSPViewController: UIViewController {

  
    @IBOutlet weak var instagramLabel: UITextField!
    @IBOutlet weak var facebookLabel: UITextField!
    @IBOutlet weak var websiteLabel: UITextField!

    let rs = RegistrationService.shared
    
    
    @IBAction func NextButton(_ sender: Any) {
        // stage 1
        guard let insta = instagramLabel.text, let fb = facebookLabel.text, let web = websiteLabel.text else {return}
        // save details to registration service
        rs.instagram = insta
        rs.facebook = fb
        rs.website = web
        
        print(rs)
        Database.createUser()
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "RegistrationConfirmationVC")
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func swicthState(_ sender: UISwitch)
    {
        switch sender.tag {
        case 0:
            print("doing something..")
        case 1:
            print("doing another something..")
        default:
            print("doing something else..")
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.keyboardDismiss))
        
        view.addGestureRecognizer(tap)

    }
    
    @objc func keyboardDismiss(){
        view.endEditing(true)
    }
   

}
