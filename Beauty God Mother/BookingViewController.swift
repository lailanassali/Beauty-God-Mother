//
//  BookingViewController.swift
//  
//
//  Created by Shanju Bakeerathan on 21/03/2019.
//

import UIKit
//
class BookingViewController: UIViewController { //, UICollectionViewDelegate, UICollectionViewDataSource{
//
//
//
//    @IBOutlet var Calendar: UICollectionView!
//    @IBOutlet var MonthLabel: UILabel!
//
//    let Months =
//        ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
//
//    let DaysOfMonth = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
//
//    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
//
//    var currentMonth = String()
//
//    var NumberOfEmptyBox = Int() //number of "empty boxes" at the start of the current month
//
//    var NextNumberOfEmptyBox = Int() //number of "empty boxes" at the start of the next month
//
//    var PreviousNumberOfEmptyBox = 0 //same with above with previous month
//
//    var Direction = 0  //=0 if we are at the current month, =1 if we are in the future month, =-1 if we are in a past month
//
//    var PositionIndex = 0 // here we will store the above vars of the empty boxes
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        currentMonth = Months[month]
//
//        MonthLabel.text = "\(currentMonth)\(year)"
//
    }
//
//
//
//
//
//
//    @IBAction func Next(_ sender: Any) {
//        switch currentMonth {
//        case "December":
//            month = 0
//            year += 1
//            Direction = 1
//
//            GetStartDateDayPosition()
//            currentMonth = Months[month]
//
//            MonthLabel.text = "\(currentMonth)\(year)"
//            Calendar.reloadData()
//        default:
//            month += 1
//            Direction = 1
//
//            GetStartDateDayPosition()
//
//            currentMonth = Months[month]
//
//            MonthLabel.text = "\(currentMonth)\(year)"
//            Calendar.reloadData()
//    }
//
//}
//
//    @IBAction func Back(_ sender: Any) {
//        switch currentMonth {
//        case "January":
//            month = 11
//            year -= 1
//            Direction = -1
//
//            GetStartDateDayPosition()
//
//            currentMonth = Months[month]
//            MonthLabel.text = "\(currentMonth)\(year)"
//            Calendar.reloadData()
//
//        default:
//            month -= 1
//            Direction = -1
//
//            GetStartDateDayPosition()
//
//            currentMonth = Months[month]
//            MonthLabel.text = "\(currentMonth)\(year)"
//            Calendar.reloadData()
//        }
//
//    }
//
//
//    func GetStartDateDayPosition() {
//        switch Direction{
//        case 0:
//            switch day{
//                case 1...7:
//                    NumberOfEmptyBox = weekday - day
//                case 8...14:
//                    NumberOfEmptyBox = weekday - day - 7
//                case 15...21:
//                    NumberOfEmptyBox = weekday - day - 14
//                case 22...28:
//                    NumberOfEmptyBox = weekday - day - 21
//                case 29...31:
//                    NumberOfEmptyBox = weekday - day - 28
//            default:
//                break
//            }
//            PositionIndex = NumberOfEmptyBox
//
//        case 1...:
//            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
//            PositionIndex = NextNumberOfEmptyBox
//
//        case -1:
//            NextNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
//            if PreviousNumberOfEmptyBox == 7 {
//                PreviousNumberOfEmptyBox = 0
//            }
//            PositionIndex = PreviousNumberOfEmptyBox
//
//
//        default:
//            fatalError()
//        }
//        }
//    }

//func collectionView(_collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    switch Direction{
//    case 0:
//        return DaysInMonths[month] + NumberOfEmptyBox
//    case 1...:
//        return DaysInMonths[month] + NextNumberOfEmptyBox
//    case -1:
//        return DaysInMonths[month] + PreviousNumberOfEmptyBox
//    default:
//        fatalError()
//    }
//
//
//
//}

    
    
    
    
    
    
    
    
    
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
// //       return DaysInMonths[month]
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
//        cell.backgroundColor = UIColor.clear
//        cell.DateLabel.text = "\(indexPath.row + 1)"
//
//
//   //     switch Direction{
// //       case:0
//    //        cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
// //       case:1
//   //         cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
//        case:-1
//  //          cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
//        default:
//            fatalError()
//        }
//        return cell
//
//    }
//
//
//}
