//
//  ProfileServicesCell.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ProfileServicesCell: UITableViewCell {
    
    @IBOutlet var servicesThumbnailImageView: UIImageView!
    @IBOutlet var servicesNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var servicesDescriptionLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
