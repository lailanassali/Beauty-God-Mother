//
//  ImageTableCellViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 06/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ImageTableCellViewController: UITableViewCell{
    
    var mainImageView :UIImageView = {
    
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ){
        super.init(style: style,reuseIdentifier: reuseIdentifier)
            self.addSubview(mainImageView)
        
        mainImageView.leftAnchor.constraint (equalTo: self.leftAnchor).isActive = true
        mainImageView.rightAnchor.constraint (equalTo: self.rightAnchor).isActive = true
        mainImageView.topAnchor.constraint (equalTo: self.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint (equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
    

    


