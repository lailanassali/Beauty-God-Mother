//
//  RegistrationService.swift
//  Beauty God Mother
//
//  Created by Laila on 18/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//
import UIKit

class RegistrationService {
    
    static var shared = RegistrationService()
    
    enum CompanyType: String {
        case residential
        case commercial
        case mobile
    }
    
    var name: String!
    var email: String!
    var password: String!
    
    var organisationName: String!
    var address: String!
    var postCode: String!
    var contactNumber: Int?
    var serviceType: String!
    var serviceName: String!
    var price: String!
    var duration: String!
    var description: String!
    var additionalInformation: String?
    var profileImage: UIImageView!
    var bio: String?
    var instagram: String?
    var facebook: String?
    var website: String?
    var companyType: CompanyType = .commercial
    
    var view = UIViewController()
    
    fileprivate func presentAlert(title: String, errorDescription: String) {
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alert = UIAlertController(title: title, message: "Please try again.", preferredStyle: .alert)
        alert.addAction(cancel)
        view.present(alert, animated: true, completion: nil)
        print(errorDescription)
        
    }
    
    public func passwordMatches(p1:String, p2:String) -> Bool {
        if p1 == p2 {
            return true
        } else {
            presentAlert(title: "Sorry, the password entered does not match!", errorDescription: "PASSWORD DO NOT MATCH!")
            return false }
    }
    
    public func nameFormatIsCorrect(name: String) -> Bool {
        if name.count <= 20 {
            return true
        } else {
            presentAlert(title: "Sorry, the name entered is too long, must be a minimum of 20 characters!", errorDescription: "NAME MUST BE LESS THAN OR EQUAL TO 20 CHARACTERS")
            return false }
    }
    
    public func fieldsAreNotEmpty(name: String, password: String, confirmPassword: String, email: String) -> Bool {
        if name.count != 0 && password.count != 0 && confirmPassword.count != 0 && email.count != 0 {
            return true
        } else {
            presentAlert(title: "Sorry, you must fill out your details to continue!", errorDescription: "FIELDS MUST NOT BE EMPTY")
            return false }
    }
    
    public func contactFieldsAreNotEmpty(name: String, address: String, postcode: String, contactNumber: String) -> Bool {
        if name.count != 0 && address.count != 0 && postcode.count != 0 && contactNumber.count != 0 {
            return true
        } else {
            presentAlert(title: "Sorry, you must fill out your details to continue!", errorDescription: "FIELDS MUST NOT BE EMPTY")
            return false }
    }
    
    
    public func contactFieldPostcodeShouldBe7CharactersOrLess(postcode: String) -> Bool {
        if postcode.count <= 7 {
            return true
        } else {
            presentAlert(title: "Sorry, your postcode must be 7 characters or less!", errorDescription: "incorrect")
            return false }
        }
    
    public func contactFieldNumberShouldBe11Characters(contactNumber: String) -> Bool {
        if contactNumber.count == 11 {
            return true
        } else {
            presentAlert(title: "Sorry, your contact number must be a UK registered number!", errorDescription: "incorrect")
            return false }
        }
    
    public func imageIsSelected(image: UIImage) -> Bool {
        if image.images?.count == 1 {
            return true
        } else {
        presentAlert(title: "Sorry", errorDescription: "You must add a profile picture to continue!")
            return false }
    }
    
    public func servicesFieldsAreNotEmpty(name: String, price: String, duration: String, description: String) -> Bool {
        if name.count != 0 && price.count != 0 && duration.count != 0 && description.count != 0 {
            return true
        } else {
        presentAlert(title: "Sorry", errorDescription: "You must fill out your details to continue!")
            return false }
    }
    
}
