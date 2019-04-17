//
//  CommentViewController.swift
//  Beauty God Mother
//
//  Created by Tiffany Tobi-Lawal on 17/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "CommentSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}


    



