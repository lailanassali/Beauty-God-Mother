//
//  SearchViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 2/10/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var table: UITableView!
    @IBOutlet var search: UISearchBar!
    
    
    // to set up table
    var beautyProviderArray = [BeautyProvider]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBeautyProviders()
    }
    
    private func setUpBeautyProviders() {
        //hair specialists
        beautyProviderArray.append(BeautyProvider(name: "laidByTiff" , special: .hair, image: "Tiff"))
        beautyProviderArray.append(BeautyProvider(name: "hairByLaila" , special: .hair, image: "Laila"))
        
        //nails specialists
        beautyProviderArray.append(BeautyProvider(name: "nailsByAisha" , special: .nails, image: "Aisha"))
        beautyProviderArray.append(BeautyProvider(name: "shanjuNails" , special: .nails, image: "Shanju"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beautyProviderArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell
        else {
            return UITableViewCell()
        }
        cell.Name.text = beautyProviderArray[indexPath.row].name
        cell.Special.text = beautyProviderArray[indexPath.row].special.rawValue
        cell.imgView.image = UIImage(named:beautyProviderArray[indexPath.row].image)
        return cell
    }
 //   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   //     return 100
   // }
}

class BeautyProvider {
    let name: String
    let image: String
    let special: BeautyProviderType

    init(name: String, special: BeautyProviderType, image: String) {
        self.name = name
        self.special = special
        self.image = image
    }
}

enum BeautyProviderType: String {
    case nails = "Nails"
    case hair = "Hair"
}
