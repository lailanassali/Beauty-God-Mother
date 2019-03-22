//
//  ViewControllerRate.swift
//  Beauty God Mother
//
//  Created by Tiffany Tobi-Lawal on 21/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ViewControllerRate: UIViewController {
    
    
    @IBOutlet weak var ratingStackView:
    RatingViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func HowManyButtonClicked(_ sender: Any)
        
    {
        print(ratingStackView.starsRating)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
