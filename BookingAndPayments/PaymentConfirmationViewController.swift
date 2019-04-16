//
//  PaymentConfirmationViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 16/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import UserNotifications

class PaymentConfirmationViewController: UIViewController {

    @IBAction func Confirmation(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "Your booking has been made"
        content.subtitle = " Thank you for using Beauty god mother "
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger (timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "Booking complete", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge] , completionHandler: {didAllow, error in
            
        })
    }
    

   

}
