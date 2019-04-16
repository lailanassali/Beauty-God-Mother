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
        
        print("Printing Strip response:\(token.allResponseFields)\n\n")
        print("Printing Strip token:\(token.tokenId)")
        
        msgBox.text = "Transaction success! \n\nHere is the token: \(token.tokenId)\nCard Type: \(token.card!.funding.rawValue)\n\nSend this token or detail to your backend server to complete this payment."
        
        self.performSegue(withIdentifier: "PaymentConfirmation", sender: self)
    }
    
    
    
    
    
}
