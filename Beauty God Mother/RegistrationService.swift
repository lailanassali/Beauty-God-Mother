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
    
    func passwordMatches(p1:String, p2:String, viewController:UIViewController) -> Bool {
        if p1 == p2 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            let alert = UIAlertController(title: "Sorry, the password entered does not match!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
            print("PASSWORD DO NOT MATCH!");return false }
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
    
    public func usernameFormatIsCorrect(username: String, viewController:UIViewController) -> Bool {
        if username.count > 3 && username.count <= 20 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            let alert = UIAlertController(title: "Sorry, the username entered is in the wrong format!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
            print("NAME MUST BE MORE THAN 3 OR LESS THAN EQUAL 20");return false }
    }
    
    public func passwordMustBeMoreThan8Characters(p1: String, p2: String, viewController:UIViewController) -> Bool {
        if p1.count > 7 || p2.count > 7 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let alert = UIAlertController(title: "Sorry, the password must be 8 characters or more!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
            print("PASSWORD MUST BE 8 CHARACTERS LONG OR MORE!");return false }
        }
    }
    
    // email function needed and tested.
    
  

