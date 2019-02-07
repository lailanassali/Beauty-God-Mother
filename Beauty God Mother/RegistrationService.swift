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
    
    public func passwordMatches(p1:String, p2:String, viewController:UIViewController) -> Bool {
        if p1 == p2 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            let alert = UIAlertController(title: "Sorry, the password entered does not match!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
            print("PASSWORD DO NOT MATCH!");return false }
    }
    
    public func passwordMustBe8Characters(p1: String, p2: String, viewController:UIViewController) -> Bool {
        if p1.count > 8 && p2.count > 98 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let alert = UIAlertController(title: "Sorry, the password must be at least 8 characters!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
            print("PASSWORD MUST BE 8 CHARACTERS"); return false }
        }
    
    public func nameFormatIsCorrect(name: String, viewController:UIViewController) -> Bool {
        if name.count <= 20 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            let alert = UIAlertController(title: "Sorry, the name entered is in the wrong format!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
            print("NAME MUST BE LESS THAN OR EQUAL TO 20 CHARACTERS");return false }
    }
}

    
   

    
    
    // email function needed and tested.
    
  

