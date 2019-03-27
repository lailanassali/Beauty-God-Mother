//
//  BookingSysteViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 27/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class BookingSysteViewController: UIViewController {
    
    var datepicker = UIDatePicker()

    @IBOutlet var Label: UILabel!
    
    @IBOutlet var SelectDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func createDatePicker(){
        datepicker.datePickerMode = .dateAndTime
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneac))
        toolbar.setItems([donebutton], animated: true)
        SelectDate.inputAccessoryView = toolbar
        
        SelectDate.inputView = datepicker
    }
    

    @objc func doneac(){
        
        SelectDate.text = "\(datepicker.date)"
        self.view.endEditing(true)
    }
    

}
