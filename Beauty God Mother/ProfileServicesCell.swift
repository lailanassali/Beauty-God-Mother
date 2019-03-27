//
//  ProfileServicesCell.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ProfileServicesCell: UITableViewCell {


    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var servicesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
