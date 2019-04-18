//
//  ConfirmationVC.swift
//  Beauty God Mother
//
//  Created by Laila on 13/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ConfirmationVC: UIViewController {
    override func viewDidLoad() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.keyboardDismiss))
        
        view.addGestureRecognizer(tap)
        
    }
    @objc func keyboardDismiss(){
        view.endEditing(true)
    }
    
    @IBAction func dismissRegistration(_ sender: UIButton) {
        self.present(RootViewController(), animated: true, completion: nil)
    }
    
}
