//
//  DetailsViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 25/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit
import AlamofireImage
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ImageIO

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var servivesView: UIView!
    @IBOutlet weak var reviewsView: UIView!
    @IBOutlet weak var mapView: UIView!


    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var servicePrice: UILabel!
    @IBOutlet weak var serviceDuration: UILabel!
    @IBOutlet weak var serviceDescription: UILabel!
    
    var profile: Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = profile.name
        categoriesLabel.text = profile.category
        imageView.af_setImage(withURL: profile.picture)
        { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            strongSelf.imageActivityIndicator.stopAnimating()
        }
        
        serviceName.text = profile.serviceName
        servicePrice.text = profile.servicePrice
        serviceDuration.text = profile.serviceDuration
        serviceDescription.text = profile.serviceDescription
        
        
        
    }
    
    @IBAction func switchViews (_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            servivesView.alpha = 1
            reviewsView.alpha = 0
            mapView.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            
            servivesView.alpha = 0
            reviewsView.alpha = 1
            mapView.alpha = 0
            
            } else {
                servivesView.alpha = 0
                reviewsView.alpha = 0
                mapView.alpha = 1
            }
    
        }
        


}
