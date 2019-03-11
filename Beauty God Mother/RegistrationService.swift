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
    
    var view = UIViewController()
    
    public func passwordMatches(p1:String, p2:String) -> Bool {
        if p1 == p2 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            let alert = UIAlertController(title: "Sorry, the password entered does not match!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            view.present(alert, animated: true, completion: nil)
            print("PASSWORD DO NOT MATCH!");return false }
    }
    
  /**  public func passwordMustBe8Characters(p1: String, p2: String, viewController:UIViewController) -> Bool {
        if p1.count > 8  && p2.count > 8 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let alert = UIAlertController(title: "Sorry, the password must be at least 8 characters!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
            print("PASSWORD MUST BE 8 CHARACTERS"); return false }
        } **/
    
    public func nameFormatIsCorrect(name: String) -> Bool {
        if name.count <= 20 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            let alert = UIAlertController(title: "Sorry, the name entered is too long, must be a minimum of 20 characters!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            view.present(alert, animated: true, completion: nil)
            print("NAME MUST BE LESS THAN OR EQUAL TO 20 CHARACTERS");return false }
    }
    
    public func fieldsAreNotEmpty(name: String, p1: String, p2: String, email: String) -> Bool {
        if name.count != 0 && p1.count != 0 && p2.count != 0 && email.count != 0 {
            return true
        } else {
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let alert = UIAlertController(title: "Sorry, you must fill out your details to continue!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            view.present(alert, animated: true, completion: nil)
            print("FIELDS MUST NOT BE EMPTY"); return false }
        }
    }


    
   

    
    
    // email function needed and tested.
    
  

