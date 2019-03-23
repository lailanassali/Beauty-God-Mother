//
//  AmdinProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 23/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class AmdinProfileViewController: UIViewController {

   
    @IBOutlet weak var adminServicesView: UIView!
    @IBOutlet weak var adminMediaView: UIView!
    @IBOutlet weak var reviewsView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func switchViews(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            adminServicesView.alpha = 1
            adminMediaView.alpha = 0
            reviewsView.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            adminServicesView.alpha = 0
            adminMediaView.alpha = 1
            reviewsView.alpha = 0
        } else {
            adminServicesView.alpha = 0
            adminMediaView.alpha = 0
            reviewsView.alpha = 1
        }
    }

}
