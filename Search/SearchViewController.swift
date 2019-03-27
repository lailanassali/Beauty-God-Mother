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
        providersArray.append(Providers(name: "Laid By Tiff", type: "Hair", image: "Tiff"))
        providersArray.append(Providers(name: "Hair By Lai", type: "Hair", image: "Lai"))
        
        // NAILS
        
        providersArray.append(Providers(name: "Nails By Aisha", type: "Nails", image: "Tiff"))
        providersArray.append(Providers(name: "Shanju Nails", type: "Nails", image: "Lai"))
        
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
        cell.imge.image = UIImage(named:currentProvidersArray[indexPath.row].image)
        return cell
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showprofile", sender: self)
        let searchViewC = storyboard?.instantiateViewController(withIdentifier: "BGMProfileVC" ) as? BGMViewController
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
        
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is BGMViewController {
     //       destination.product = currentProvidersArray[]
            }
        }
    }



class Providers {
    let name: String
    let type: String
    let image: String
    //let rating:
    
    init(name: String, type: String, image: String){
        self.name = name
        self.type = type
        self.image = image
        
    }
}
    

        

// func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "showProfile" {
//            let destinationController = segue.destination as! BGMViewController
//            destinationController.image = image
//
//            }
//
//            }



}
