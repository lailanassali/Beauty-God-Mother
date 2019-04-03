//
//  Booking2ViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 03/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class Booking2ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet var Calendar2: UICollectionView!
    @IBOutlet var MonthLabel2: UILabel!
    
    
    
    let Months =
        ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
    
    let DaysOfMonth =
        ["Monday","Tueaday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        
        MonthLabel2.text = "\(currentMonth) \(year)"
        
        
    }
    
    
    
    @IBAction func Next2(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            
            currentMonth = Months[month]
            
            MonthLabel2.text = "\(currentMonth) \(year)"
            Calendar2.reloadData()
            
        default:
            month += 1
            
            currentMonth = Months[month]
            MonthLabel2.text = "\(currentMonth) \(year)"
            Calendar2.reloadData()
        }
    }

    
    
    @IBAction func Back2(_ sender: Any) {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            
            currentMonth = Months[month]
            
            MonthLabel2.text = "\(currentMonth) \(year)"
            Calendar2.reloadData()
            
        default:
            month -= 1
            
            currentMonth = Months[month]
            
            MonthLabel2.text = "\(currentMonth) \(year)"
            Calendar2.reloadData()
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DaysInMonths[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! Date2CollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.DateLabel2.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
  

}
