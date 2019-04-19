//
//  SearchCell.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 15/03/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import AlamofireImage

class SearchCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageLabel.af_cancelImageRequest()
    }
    
    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    func configure(with profile: Profile) {
                nameLabel.text = profile.name
                typeLabel.text = profile.category
                    imageLabel.af_setImage(withURL: profile.picture)
        }
}



