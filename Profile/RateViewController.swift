//
//  RateViewController.swift
//  Beauty God Mother
//
//  Created by Tiffany Tobi-Lawal on 15/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {


   
    @IBOutlet weak var ratingStackView: RatingViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func HowManyButtonClicked(_ sender: Any)
    {
        print(ratingStackView.starRating)
}
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

}
}











