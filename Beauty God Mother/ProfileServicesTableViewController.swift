//
//  ServicesViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/25/19.
//  Copyright © 2019 BGM. All rights reserved.
//

//import UIKit
//
//struct CellData {
//    let serviceImage: UIImage?
//    let service: String?
//    let price: String?
//    let time: String?
//    let serviceDescription: String?
//}
//
//class ProfileServicesViewController : UITableViewController {
//
//    var data = [CellData]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        data = [CellData.init(serviceImage: "image , service: "service", price: "price", time: "how long", serviceDescription: "servicedesc")]
//
//        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
//        cell.mainImage = data[indexPath.row].image
//        cell.service = data[indexPath.row].service
//        return cell
//
//    }
//
//
//}
