//
//  Booking2ViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 08/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class Booking2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Time.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Time[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTime = Time[row]
        TimeTextField.text = selectedTime
    }
    
    
    var selectedTime : String?
    
    var Time = ["10.00 AM","11:00 AM","12:00 PM","1.00 PM", "2.00 PM","3:00 PM", "4.00 PM","5:00PM","6:00 PM",]
    
    func createPickerView()
    {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        TimeTextField.inputView = pickerView
    
    }
    
    @objc func dismissPickerView()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
   
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        TimeTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    
    
    
    @IBOutlet var TimeTextField: UITextField!
    
    
    
    @IBOutlet var Calendar2: UICollectionView!
    @IBOutlet var MonthLabel2: UILabel!
    
    
    
    let Months =
        ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
    
    let DaysOfMonth =
        ["Monday","Tueaday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var NumberOfEmptyBox = Int()    //number of empty boxes at the start of the current month
    
    var NextNumberOfEmptyBox = Int()
    
    var PreviousNumberOfEmptyBox = 0
    
    var Direction = 0
    
    var PositionIndex = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        
        MonthLabel2.text = "\(currentMonth) \(year)"
        
        createPickerView()
        
        dismissPickerView()
    }
    
    
    
    @IBAction func Next2(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            Direction = 1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel2.text = "\(currentMonth) \(year)"
            Calendar2.reloadData()
            
        default:
            Direction = 1
            
            GetStartDateDayPosition()
            
            
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
            Direction = -1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel2.text = "\(currentMonth) \(year)"
            Calendar2.reloadData()
            
        default:
            month -= 1
            Direction = -1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel2.text = "\(currentMonth) \(year)"
            Calendar2.reloadData()
        }
    }
    
    func GetStartDateDayPosition() {
        switch Direction{
        case 0:
            switch weekday{
            case 1...7:
                NumberOfEmptyBox = weekday - day
            case 8...14:
                NumberOfEmptyBox = weekday - day - 7
            case 15...21:
                NumberOfEmptyBox = weekday - day - 14
            case 22...28:
                NumberOfEmptyBox = weekday - day - 21
            case 29...31:
                NumberOfEmptyBox = weekday - day - 28
            default:
                break
            }
            PositionIndex = NumberOfEmptyBox
            
        case 1...:
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1:
            PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction {
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! dateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        //cell.DateLabel2.textColor = UIColor.magenta
        
        if cell.isHidden{
            cell.isHidden = false
        }
        
        switch Direction {
        case 0:
            cell.DateLabel2.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.DateLabel2.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel2.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        // any cell that is less than 1 is hidden
        if Int(cell.DateLabel2.text!)! < 1{
            cell.isHidden = true
        }
        
        return cell
    }
    
    

}
