//
//  RatingViewController.swift
//  Beauty God Mother
//
//  Created by Tiffany Tobi-Lawal on 15/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class RatingViewController: UIStackView {
    var starRating = 0
    var starsEmptyPicName = "star"
    var starsFilledPicName = "starfill"
    override func draw(_ rect: CGRect) {
        let myViews = self.subviews.filter{$0 is UIButton}
        var starTag = 1
        for theView in myViews {
            if let theButton = theView as? UIButton{
                theButton.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                theButton.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                theButton.tag = starTag
                starTag = starTag + 1
            }
        }
    }

    @objc func pressed(sender: UIButton) {
        starRating = sender.tag
        let myViews = self.subviews.filter{$0 is UIButton}
        for theView in myViews {
            if let theButton = theView as? UIButton{
                if theButton.tag > sender.tag {
                    theButton.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                }else{
                    theButton.setImage(UIImage(named: starsFilledPicName), for: .normal)
                }
            }
        }
    }
}
