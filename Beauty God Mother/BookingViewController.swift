//
//  BookingViewController.swift
//  
//
//  Created by Shanju Bakeerathan on 21/03/2019.
//

import UIKit

class BookingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    

    
    @IBOutlet var Calendar: UICollectionView!
    @IBOutlet var MonthLabel: UILabel!
    
    let Months =
        ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
    
    let DaysOfMonth = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        
        MonthLabel.text = "\(currentMonth)\(year)"
        
    }
    
    
    
    
    
    
    @IBAction func Next(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            
            currentMonth = Months[month]

            
            MonthLabel.text = "\(currentMonth)\(year)"
            Calendar.reloadData()
        default:
            month += 1
            
            currentMonth = Months[month]

            MonthLabel.text = "\(currentMonth)\(year)"
            Calendar.reloadData()
    }
    
}
    
    @IBAction func Back(_ sender: Any) {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            
            currentMonth = Months[month]
            
            MonthLabel.text = "\(currentMonth)\(year)"
            Calendar.reloadData()
            
        default:
            month -= 1
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth)\(year)"
            Calendar.reloadData()
        }
        
    }
    
    

   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DaysInMonths[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.DateLabel.text = "\(indexPath.row + 1)"
        
        return cell
        
    }
    

}
