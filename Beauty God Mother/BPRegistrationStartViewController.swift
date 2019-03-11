//
//  BPRegistrationStartViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 21/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class BPRegistrationStartViewController: UIViewController {

    
    @IBOutlet weak var nameOfOrganisation: UITextField!
    
    @IBOutlet var addressTF: UITextField!
    
    @IBOutlet weak var postcodeTF: UITextField!
    
    var rs = RegistrationService.shared
    
    @IBAction func nextTapped(_ sender: Any) {
            handleRegister()
 
        }
    
    public func handleRegister() {
        guard let name = nameOfOrganisation.text, let address = addressTF.text, let postcode = postcodeTF.text else {return}
        
        if !rs.contactFieldsShouldNotBeEmpty(name: name, address: address, postcode: postcode) {  return }
        
            self.performSegue(withIdentifier: "RegisterStageTwo", sender: self)
        }
        
        
    
    }
    
   

    

