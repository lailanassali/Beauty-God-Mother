//
//  ConfirmationDetailsBP.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 07/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class confirmationDetailsBPViewController: UIViewController {
    
 
    
   // let bearImageView: UIImageView = {
      //  let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        // this enables autolayout for our imageView
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        //return imageView
  //  }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "we would like to get to know you"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here's our entry point into our app
       // view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    private func setupLayout() {
       // bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      //  bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
     //   bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
     //   bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
      //  descriptionTextView.topAnchor.constraint(equalTo: //bearImageView.bottomAnchor, constant: 120).isActive = true
            
                                                // descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
                                          //       descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       
                                              //   descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
  //  }
    
    
    
    
    
}




}
