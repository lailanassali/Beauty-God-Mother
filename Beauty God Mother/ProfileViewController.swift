//
//  ProfileViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 25/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//


import UIKit
import FirebaseAuth


class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
  var iconArray = [UIImage(named: "webicon"),UIImage(named: "instaicon"),UIImage(named: "fbicon"),UIImage(named: "mailicon"),UIImage(named: "phoneicon"),]
    
    @IBOutlet weak var servicesContainer: UIView!
    @IBOutlet weak var mediaContainer: UIView!
    @IBOutlet weak var reviewsContainer: UIView!
    
    
    override func viewDidLoad (){
        super.viewDidLoad()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return iconArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCollectionViewCell", for: indexPath)
        as? ContactCollectionViewCell
        
       cell?.ContactIcons.image = iconArray[indexPath.row]
        return cell!
    }
    
    
    @IBAction func showComponents(_ sender: AnyObject) {
        
        if(sender.selectedSegmentIndex == 0)
        {
            UIView.animate(withDuration: 0.5, animations: {
                
                self.servicesContainer.alpha = 1
                self.mediaContainer.alpha = 0
                self.reviewsContainer.alpha = 0
            })
                
        }
            else if (sender.selectedSegmentIndex == 1)
        {
            UIView.animate(withDuration: 0.5, animations: {
                
                self.mediaContainer.alpha = 1
                self.servicesContainer.alpha = 0
                self.reviewsContainer.alpha = 0
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                
                self.reviewsContainer.alpha = 1
                self.servicesContainer.alpha = 0
                self.mediaContainer.alpha = 0
            })
        }
    }
}


