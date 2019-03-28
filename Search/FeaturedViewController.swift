//
//  FeaturedViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 28/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {

    private enum SegueIdentifiers {
        static let Embed = "Embed"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Featured Profile"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = segue.destination as? ProfileViewController,
            segue.identifier == SegueIdentifiers.Embed {
            profileViewController.profile = DataProvider.shared.featuredProfile
        }
    }

}
