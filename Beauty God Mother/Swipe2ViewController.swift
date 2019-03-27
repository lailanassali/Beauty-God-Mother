//
//  Swipe2ViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 18/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class Swipe2ViewController: UITableViewController{
    @IBOutlet weak var TableServices: UITableView!
    
    let services = ["Hair","Nails","Massage","Makeup","Grooming","Surgerical","Tanning", "Facials and skincare"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return services.count
    }
    
   // override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell
        
   // {
     //  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     //   cell.textLabel?.text = services[indexPath.row]
     //   return cell
   // }
    
    
  //  }


   // override func viewDidLoad() {
       // super.viewDidLoad()
//{
      //  let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        //rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
       // self.view.addGestureRecognizer(rightSwipe)

//}
 
  


}
