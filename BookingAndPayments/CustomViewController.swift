//
//  CustomViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 22/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit
import Stripe

class CustomViewController: UIViewController {
    
    
    @IBOutlet var CardName: UITextField!
    @IBOutlet var CardNumber: UITextField!
    @IBOutlet var ExpiryDate: UITextField!
    @IBOutlet var CVC: UITextField!
    @IBOutlet var Message: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Custom"
        Message.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func MakePayment(_ sender: Any) {
        
       
        
    }
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
