//
//  Registration2ViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 28/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
class Registration2ViewController: UIViewController {

    @IBOutlet var ServicesOutlet: UIButton!
    @IBOutlet var ServicesListOutlets: [UIButton]!
    
    
    @IBAction func ServicesAction(_ sender: UIButton) {
        ServicesListOutlets.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    @IBAction func ServicesListsAction(_ sender: UIButton) {
        ServicesOutlet.titleLabel?.text = sender.titleLabel?.text
        ServicesListOutlets.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.keyboardDismiss))
        
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    @objc func keyboardDismiss(){
        view.endEditing(true)
    }
    
    @IBAction func ClearButton(_ sender: Any) {
    
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    
    }
    

}
