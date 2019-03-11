//
//  HairServicesViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 07/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class HairServicesViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func slider(_ sender: UISlider)
        
    {
        label.text = String (sender.value)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

 
   
}
