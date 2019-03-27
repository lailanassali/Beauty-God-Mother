//
//  ServicesViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/25/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
//
//struct CellData {
//    let serviceImage: UIImage?
//    let service: String?
//    let price: String?
//    let time: String?
//    let serviceDescription: String?
//}
//
class ProfileServicesTableViewController : UITableViewController {
    


    
    
    var serviceNames = ["frontal", "closure"]
    var servicePrices = ["£100", "£80"]
    var durations = ["1hr20", "1hr"]
    var serviceDescriptions = ["I will make and design and install a frontal", "I will make and design and install a closure"]
    var serviceImages = ["closureWig", "closureWig"]
//
//    var data = [CellData]()
//
   override func viewDidLoad() {
       super.viewDidLoad()
//
//        data = [CellData.init(serviceImage: "image , service: "service", price: "price", time: "how long", serviceDescription: "servicedesc")]
//
//        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
    }
//
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
    }
//
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ProfileCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProfileServicesCell
//        
//        cell.servicesNameLabel.text = serviceNames[indexPath.row]
//        cell.priceLabel.text = servicePrices[indexPath.row]
//        cell.durationLabel.text = durations[indexPath.row]
//        cell.servicesDescriptionLabel.text = serviceDescriptions[indexPath.row]
//        cell.servicesThumbnailImageView.image = UIImage(named: serviceImages[indexPath.row])
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt: IndexPath) -> CGFloat {
        return 100.0
    }
    


//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
//        cell.mainImage = data[indexPath.row].image
//        cell.service = data[indexPath.row].service
//        return cell
//
    }
//
//


