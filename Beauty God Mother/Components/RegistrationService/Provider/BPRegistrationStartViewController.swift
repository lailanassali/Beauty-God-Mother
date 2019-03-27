//
//  BPRegistrationStartViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 21/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class BPRegistrationStartViewController: UIViewController {

    
    @IBOutlet weak var organisationName: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var postcodeLabel: UITextField!
    @IBOutlet weak var contactNumberLabel: UITextField!
    
    let rs = RegistrationService.shared
    @IBAction func NextButton(_ sender: Any) {
        // stage 1
        guard let organisationName = organisationName.text, let address = addressLabel.text, let postcode = postcodeLabel.text, let contactNumber = contactNumberLabel.text else {return}
        
        // stage 2
        if !rs.contactFieldsAreNotEmpty(name: organisationName, address: address, postcode: postcode, contactNumber: contactNumber) { return }
        
        // save details to registration service
        rs.organisationName = organisationName
        rs.address = address
        rs.contactNumber = Int(contactNumber)
        rs.postCode = postcode
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "ServicesVC")
        self.present(controller, animated: true, completion: nil)
    }

    
    

    

}
