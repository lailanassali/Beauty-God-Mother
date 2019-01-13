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
        
    }
    
    @IBAction func dismissRegistration(_ sender: UIButton) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
