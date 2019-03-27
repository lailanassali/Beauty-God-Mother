//
//  BGMProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 27/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class BGMProfileViewController: UIViewController {
    

    @IBOutlet var profileImageView: UIImageView!
    
    var profileImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.image = UIImage(named: profile)

    }
    

   
}
