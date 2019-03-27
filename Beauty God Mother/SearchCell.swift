//
//  SearchCell.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/15/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
