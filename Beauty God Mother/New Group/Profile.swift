//
//  File.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 28/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import Foundation
import UIKit


struct Profile: Codable {
    let id: Int
    let name: String
    let category: String
    let picture: URL
    let serviceName: String
    let servicePrice: String
    let serviceDuration: String
    let serviceDescription: String
   
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case category = "category"
        case picture = "picture"
        case serviceName = "serviceName"
        case servicePrice = "price"
        case serviceDuration = "duration"
        case serviceDescription = "description"

    }
}
    
    extension Profile: Equatable {
        static func ==(lhs: Profile, rhs: Profile) -> Bool {
            return lhs.id == rhs.id
    }
}
