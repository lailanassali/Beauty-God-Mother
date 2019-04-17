//
//  StandardViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 22/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Stripe

class StandardViewController: UIViewController, STPAddCardViewControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Standard"
        msgBox.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var msgBox: UITextView!
    @IBAction func PaymentTapped(_ sender: Any) {
        // Setup add card view controller
        let addCardViewController = STPAddCardViewController()
        addCardViewController.delegate = self
        // present add card view controller
        let navigationController = UINavigationController(rootViewController: addCardViewController)
        present(navigationController, animated: true)
        
    }
    
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        // dsmiss add card view controller
        dismiss(animated: true)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        
        dismiss(animated: true)
        
        
        
       self.performSegue(withIdentifier: "PaymentConfirmation", sender: self)
         
    }
    
    
    
    
    
}
