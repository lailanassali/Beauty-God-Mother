//
//  SearchViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/15/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet var table: UITableView!
    @IBOutlet var search: UISearchBar!
    
    var providersArray = [Providers]()
    var currentProvidersArray = [Providers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProviders()
        setUpSearchBar()
    }
    
    private func setUpSearchBar(){
        //include search bar placeholder
    }
    
    // Details and List of all beauty providers
    private func setUpProviders() {
        // HAIR
        providersArray.append(Providers(name: "Laid By Tiff", type: "Hair", profileImage: "Tiff"))
        providersArray.append(Providers(name: "Hair By Lai", type: "Hair", profileImage: "Lai"))
        
        // NAILS
        
        providersArray.append(Providers(name: "Nails By Aisha", type: "Nails", profileImage: "Tiff"))
        providersArray.append(Providers(name: "Shanju Nails", type: "Nails", profileImage: "Lai"))
        
        currentProvidersArray = providersArray
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentProvidersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as? SearchCell else {
            return UITableViewCell()
}
        cell.name.text = currentProvidersArray[indexPath.row].name
        cell.type.text = currentProvidersArray[indexPath.row].type
        cell.profileImage.image = UIImage(named:currentProvidersArray[indexPath.row].profileImage)
        return cell
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchViewC = storyboard?.instantiateViewController(withIdentifier: "BGMProfileVC" ) as? ProfileViewController
        self.navigationController?.pushViewController(searchViewC!, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {
            currentProvidersArray = providersArray
            table.reloadData()
            return
        }
    currentProvidersArray = providersArray.filter({ providers -> Bool in
        guard let searchText = searchBar.text else { return false }
        return providers.type.lowercased().contains(searchText.lowercased())
    })
        table.reloadData()
        
        }
   
//    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "showProfileDetail" {
//            
//            guard let BGMProfileViewController = segue.destination as? BGMProfileViewController,
//                let index = table.indexPathForSelectedRow?.row
//                else {
//                    return
//            }
//            BGMProfileViewController.profileImageName = providersArray[IndexPath.profileImage]
//        }
//    }
//    
class Providers {
    let name: String
    let type: String
    let profileImage: String
    //let rating:
    
    init(name: String, type: String, profileImage: String){
        self.name = name
        self.type = type
        self.profileImage = profileImage
        
    }
}
    
//    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "showProfileDetail" {
//            if let indexPath = table.indexPathForSelectedRow {
//                let destinationController = segue.destination as! BGMProfileViewController
//                destinationController.profileImageName = profileImage[indexPath.row]
//            }
//        }
//    }


}
