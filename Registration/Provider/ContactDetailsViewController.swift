//
//  BPRegistrationStartViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 21/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    
    @IBOutlet weak var organisationName: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var postcodeLabel: UITextField!
    @IBOutlet weak var contactNumberLabel: UITextField!
    @IBOutlet weak var fieldsEmptyAlert: UILabel!
    @IBOutlet weak var postcodeAlert: UILabel!
    @IBOutlet weak var contactNumberAlert: UILabel!
    
    let rs = RegistrationService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldsEmptyAlert.isHidden = true
        postcodeAlert.isHidden = true
        contactNumberAlert.isHidden = true
    }
    
    public func fieldsAreNotEmpty(organisationName: String, city: String, postcode: String, contactNumber: String) -> Bool {
        if organisationName.count != 0 && city.count != 0 && postcode.count != 0 && contactNumber.count != 0 {
            return true
        } else {
            fieldsEmptyAlert?.isHidden = false
            return false
        }
    }
    
    public func postcodeMustBe7Or8CharactersLong(postcode: String) -> Bool{
        if postcode.count >= 7 && postcode.count <= 8 {
            return true
        } else {
            postcodeAlert?.isHidden = false
            return false
        }
    }
    
    public func contactNumberMustBe11CharactersLong(contactNumber: String) -> Bool {
        if contactNumber.count == 11 {
            return true
        } else {
            contactNumberAlert?.isHidden = false
            return false
        }
    }
    
    @IBAction func NextButton(_ sender: Any) {
        // stage 1
        guard let organisationName = organisationName.text, let address = addressLabel.text, let postcode = postcodeLabel.text, let contactNumber = contactNumberLabel.text else {return}
        
        // stage 2
        if !fieldsAreNotEmpty(organisationName: organisationName, city: address, postcode: postcode, contactNumber: contactNumber) || !contactNumberMustBe11CharactersLong(contactNumber: contactNumber) || !postcodeMustBe7Or8CharactersLong(postcode: postcode) { return }
        
        
        // save details to registration service
        rs.organisationName = organisationName
        rs.address = address
        rs.contactNumber = Int(contactNumber)
        rs.postCode = postcode
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "ServicesVC")
        self.present(controller, animated: true, completion: nil)
    }
}
