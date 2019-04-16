//
//  ServicesViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 07/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController  {
    
   
    let rs = RegistrationService.shared
    
    @IBOutlet weak var nameOfService: UITextField!
    @IBOutlet weak var priceLabel: UITextField!
    @IBOutlet weak var durationLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var addtionalnfoLabel: UITextField!
    @IBOutlet weak var fieldsEmpty: UILabel!
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        fieldsEmpty.isHidden = true
        
    }
    
    public func fieldsAreNotEmpty(nameOfService: String, price: String, duration: String, description: String) -> Bool {
        if nameOfService.count != 0 && price.count != 0 && duration.count != 0 && description.count != 0 {
            return true
        } else {
              fieldsEmpty?.isHidden = false
            return false }
    }
    
    @IBAction func NextButton(_ sender: Any) {
        // stage 1
        guard let serviceName = nameOfService.text, let price = priceLabel.text, let duration = durationLabel.text, let description = descriptionLabel.text, let additionalInformation = addtionalnfoLabel.text else {return}
        
        // stage 2
        if !fieldsAreNotEmpty(nameOfService: serviceName, price: price, duration: duration, description: description) || !rs.nameFormatIsCorrect(name: serviceName) { return }
        
        // save details to registration service
        rs.serviceName = serviceName
        rs.price = price
        rs.duration = duration
        rs.description = description
        rs.additionalInformation = additionalInformation
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "Swipe3VC")
        self.present(controller, animated: true, completion: nil)
    }
    
    
}







