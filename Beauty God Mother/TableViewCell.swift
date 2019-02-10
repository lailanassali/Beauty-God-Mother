//
//  TableViewCell.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 2/10/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var Name: UILabel!
    @IBOutlet var Special: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
