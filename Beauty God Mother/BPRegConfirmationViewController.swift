//
//  BPRegConfirmationViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 21/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Lottie

class BPRegConfirmationViewController: UIViewController {

  
    @IBOutlet var animationView: LOTAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()

        // Do any additional setup after loading the view.
    }
    
    func startAnimation(){
        animationView.setAnimation(named: "732-tick-reveal")
        animationView.play()
        
    }

} 
