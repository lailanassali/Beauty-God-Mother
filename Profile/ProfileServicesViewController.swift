//
//  ProfileServicesViewController.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ProfileServicesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
    
    
    @IBOutlet weak var servicesTable: UITableView!
    @IBOutlet weak var servicesSearch: UISearchBar!
    
    var serviceArray = [Service]()
    var currentServiceArray = [Service]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpServices()
        setUpSearchBar()

    
    }
    
    private func setUpSearchBar(){
        //include search bar placeholder
    }

    private func setUpServices() {
        // HAIR
        serviceArray.append(Service(serviceName: "Closure", duration: "1hr", price: "£100", description: "i will do a closure", image: "closurewig"))
        serviceArray.append(Service(serviceName: "Frontal", duration: "2hr", price: "£200", description: "i will do a frontal", image: "closurewig"))
        serviceArray.append(Service(serviceName: "Dyeing service", duration: "2hr", price: "£200", description: "i will do a frontal", image: "closurewig"))
        serviceArray.append(Service(serviceName: "Fullani braids", duration: "2hr", price: "£200", description: "i will do a frontal", image: "closurewig"))
        serviceArray.append(Service(serviceName: "Chunky braids", duration: "2hr", price: "£200", description: "i will do a frontal", image: "closurewig"))
        serviceArray.append(Service(serviceName: "Sew-in", duration: "2hr", price: "£200", description: "i will do a frontal", image: "closurewig"))
        serviceArray.append(Service(serviceName: "Wash and treat", duration: "2hr", price: "£200", description: "i will do a frontal", image: "closurewig"))
        
        
        currentServiceArray = serviceArray
    }
    
//    private func setUpSearchBar() {
//        searchBar.delegate = self
//    }
//
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentServiceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as? ProfileServicesCell else {
            return UITableViewCell()
        }
        
        cell.serviceName.text = currentServiceArray[indexPath.row].serviceName
        cell.priceLabel.text = currentServiceArray[indexPath.row].price
        cell.durationLabel.text = currentServiceArray[indexPath.row].duration
        cell.descriptionLabel.text = currentServiceArray[indexPath.row].description
        cell.servicesImage.image = UIImage(named:currentServiceArray[indexPath.row].image)

        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String){
        currentServiceArray = serviceArray.filter({ Service -> Bool in
            guard let text = searchBar.text else { return false }
            return Service.serviceName.contains(text)
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        
    }

}
class Service {
    let serviceName: String
    let duration: String
    let price: String
    let description: String
    let image: String
    //let rating:
    
    //init(name: String, type: String, image: String){
    init(serviceName: String, duration: String, price: String, description: String, image: String){
        self.serviceName = serviceName
        self.duration = duration
        self.price = price
        self.description = description
        self.image = image
        
    }
}

