//
//  ProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 25/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    
    var profile: Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageActivityIndicator.startAnimating()
        nameLabel.text = profile.name
        categoriesLabel.text = profile.category
        imageView.af_setImage(withURL: profile.picture)
        { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            strongSelf.imageActivityIndicator.stopAnimating()
        }
        
    }
    

}


