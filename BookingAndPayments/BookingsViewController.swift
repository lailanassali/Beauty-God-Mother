//
//  BookingsViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class BookingsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    

    @IBOutlet var Calendar: UICollectionView!
    @IBOutlet var Monthlabel: UILabel!
    
     
    let months = ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
    let DaysofMonth = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    var DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        currentMonth = months[month]
        
        Monthlabel.text = "\(currentMonth)\(year)"
        
        
        
        
    }
    
    
    
    
    @IBAction func Next(_ sender: Any) {
    }
    
    @IBAction func Back(_ sender: Any) {
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DaysInMonth[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendar ", for: indexPath) as!DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.DateLabel.text = "\(indexPath.row + 1)"
        
        return cell
    }

}
