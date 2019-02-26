//
//  ServicesTableViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 26/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ServicesTableViewController: UITableViewController {
    
    let services = ["Nails", "Grooming", "Makeup","Hair","Massages"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return services.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = services[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
}
