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
        if let detailsViewController = segue.destination as? DetailsViewController,
            segue.identifier == SegueIdentifiers.Embed {
            detailsViewController.profile = DataProvider.shared.featuredProfile
        }
    }

}
