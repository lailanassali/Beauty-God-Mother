//
//  RatingViewController.swift
//  Beauty God Mother
//
//  Created by Tiffany Tobi-Lawal on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {
    
   
    
    @IBOutlet weak var floatingRatingView: FloatRatingView!
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Reset float rating view's background color
            
            floatingRatingView.backgroundColor = UIColor.clear
            
            /** Note: With the exception of contentMode, type and delegate,
             all properties can be set directly in Interface Builder **/
            floatingRatingView.delegate = self as? FloatRatingViewDelegate
            floatingRatingView.contentMode = UIView.ContentMode.scaleAspectFit
            
            

         //    Labels init
            liveLabel.text = String(format: "%.2f", self.floatingRatingView.rating)
            updatedLabel.text = String(format: "%.2f", self.floatingRatingView.rating)

    }
}

    extension RatingViewController: FloatRatingViewDelegate {
//
//
        func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
            liveLabel.text = String(format: "%.2f", floatingRatingView.self)
       //     "";, arguments: self.floatingRatingView)
        }
//
//
   func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
       updatedLabel.text = String (format: "%.2f", floatingRatingView.self)
  }

    


}
