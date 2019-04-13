//
//  SearchViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 28/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        
        profiles = DataProvider.shared.allProfiles
   // print(profiles[0].services)
        // Do any additional setup after loading the view.
    }
}

extension SearchViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.SearchCell, for: indexPath) as! SearchCell
        cell.configure(with: profiles[indexPath.row])
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


