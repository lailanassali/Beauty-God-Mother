//
//  ViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOUTLETS

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerAsSP: UIButton!
    @IBOutlet weak var registerAsBuyer: UIButton!
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.addSubview(topView)
        
    }
    
    fileprivate func setupViews() {
        let buttonArray = [registerAsSP, registerAsBuyer]
        
        for i in buttonArray {
            i?.layer.cornerRadius = 24
            i?.layer.shadowOffset = CGSize(width: 0, height: 15)
            i?.layer.shadowRadius = 15
            i?.layer.borderColor = #colorLiteral(red: 0.8833980709, green: 0.6338821987, blue: 1, alpha: 1)
            i?.layer.borderWidth = 2
        }
    }


}

