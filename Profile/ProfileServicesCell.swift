//
//  ProfileServicesCell.swift
//  Beauty God Mother
//
//  Created by aishat alonge on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ProfileServicesCell: UITableViewCell {
    
    @IBOutlet weak var serviceNamelbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var durationlbl: UILabel!
    @IBOutlet weak var serviceDescriptionlbl: UILabel!
    
    
    func configure(with profile: profileServices) {
        serviceNamelbl.text = profile.serviceName
        pricelbl.text = profile.price
        durationlbl.text = profile.duration
        serviceDescriptionlbl.text = profile.serviceDescription
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
