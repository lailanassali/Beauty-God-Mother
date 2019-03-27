//
//  LoginService.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 25/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class LoginService {

    var view = UIViewController()
    static var shared = LoginService()
        
    public func fieldsShouldNotBeEmpty(email: String, password: String) -> Bool {
        if email.count != 0 && password.count != 0 {
                return true
            } else {
                presentAlert(title: "Sorry, you must enter your login details to continue!", errorDescription: "FIELDS MUST NOT BE EMPTY")
                return false }
        }
        
        fileprivate func presentAlert(title: String, errorDescription: String) {
            
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let alert = UIAlertController(title: title, message: "Please try again.", preferredStyle: .alert)
            alert.addAction(cancel)
            
            view.present(alert, animated: true, completion: nil)
            print(errorDescription)
        }

    }
