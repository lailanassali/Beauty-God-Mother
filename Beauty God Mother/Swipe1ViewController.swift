//
//  Swipe1ViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class Swipe1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction (swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)

    
    }
    

  


}

extension UIViewController
{
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
        
    {
        switch swipe.direction.rawValue {
        case 2:
            performSegue(withIdentifier: "goRight", sender: self)
        default:
            break
    }
}
    
}
