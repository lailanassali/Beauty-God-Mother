//
//  RatingViewController.swift
//  Beauty God Mother
//
//  Created by Tiffany Tobi-Lawal on 17/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {
    
    @IBOutlet var starButtons: [UIButton]!
    
    
    @IBAction func starButtonTap(_ sender: UIButton) {
    let tag = sender.tag
        for button in starButtons {
        if button.tag <= tag {
            //if its less than or equal to the tag number of the tapped
            //button then fill the button and select this button
            button.setTitle("★", for: .normal)
        } else {
             button.setTitle("☆", for: .normal)
            // show them as not selected
        
        }
        }
        


}
}
    
    
    
    

