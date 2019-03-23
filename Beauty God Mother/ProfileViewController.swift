//
//  ProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 25/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage



class ProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var servicesView: UIView!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var reviewsView: UIView!


    
    override func viewDidLoad (){
        super.viewDidLoad()

        

}


    @IBAction func switchViews(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            servicesView.alpha = 1
            mediaView.alpha = 0
            reviewsView.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            servicesView.alpha = 0
            mediaView.alpha = 1
            reviewsView.alpha = 0
        } else {
            servicesView.alpha = 0
            mediaView.alpha = 0
            reviewsView.alpha = 1
        }
    }

}

