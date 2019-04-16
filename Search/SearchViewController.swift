//
//  SearchViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 28/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchViewController: UIViewController {

    private enum CellIdentifiers {
        static let SearchCell = "SearchCell"
    }
    
    private enum StoryboardNames {
        static let Main = "Main"
    }
    
    private enum ViewControllerIdentifiers {
        static let Detail = "DetailsVC"
    }
    
    @IBOutlet var tableView: UITableView!
    
    private var profiles: [Profile] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    let dataProvider = NSData(contentsOfFile: Bundle.main.path(forResource: "profile", ofType: "json")!)
    var profile: JSON?
    var filteredprofile = [JSON]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        
        profiles = DataProvider.shared.allProfiles
   // print(profiles[0].services)
        // Do any additional setup after loading the view.
        
        do {
            profile = try JSON(data: dataProvider! as Data)
        } catch {
            
        }
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filterContentForSearch(searchText: String){
        filteredprofile = profile!.array!.filter{ profile in
            return profile["category"].stringValue.lowercased().contains(searchText.lowercased())
            
    }
            
    tableView.reloadData()
}
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearch(searchText: searchController.searchBar.text!)
    }
}

extension SearchViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != ""{
         return filteredprofile.count
        }
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.SearchCell, for: indexPath) as! SearchCell
        var data: JSON
        if searchController.isActive && searchController.searchBar.text != ""{
        data = filteredprofile[indexPath.row]
        }else{
            
            data = profile![indexPath.row]
        }
          let profileCategory = data["category"].stringValue
        cell.textLabel?.text = profileCategory
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: StoryboardNames.Main, bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.Detail) as? DetailsViewController else {
            return
        }
        
        detailViewController.profile = profiles[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    } 
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


