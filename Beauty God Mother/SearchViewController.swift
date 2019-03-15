//
//  SearchViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/15/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var table: UITableView!
    @IBOutlet var search: UISearchBar!
    var providersArray = [Providers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    var name = ["Laid By Tiff","Hair By Lai"]
    var type = ["Hair","Hair"]
    var image = ["Tiff","Lai"]
var providersList = Array<Providers>()

func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
    return name.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as? SearchCell else {
        return UITableViewCell()
    }
    
    cell.name.text = name[indexPath.row]
    cell.type.text = type[indexPath.row]
    cell.imge.image = UIImage(named:image[indexPath.row])
    return cell
}

class Providers {
    let name: String
    let type: String
    let image: String
    //let rating:
    
    init(name: String, type:String, image: String){
        self.name = name
        self.type = type
        self.image = image
        
    }
}
