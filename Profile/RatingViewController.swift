//
//  RatingViewController.swift
//  Beauty God Mother
//
//  Created by Tiffany Tobi-Lawal on 17/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit

class RatingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.keyboardDismiss))
        
        view.addGestureRecognizer(tap)

    }
    @objc func keyboardDismiss(){
        view.endEditing(true)
    }
    
    @IBAction func leaveCommentButtonPressed(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "CommentViewSegue", sender: self)
    }
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
