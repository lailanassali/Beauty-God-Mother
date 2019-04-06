//
//  File.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 28/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import Foundation
import UIKit

struct Service2: Codable {
    let name: String
    let price: Int
    let location: String
}

struct Profile: Codable {
    let id: Int
    let name: String
    let category: String
    let picture: URL
    let services: [Service2]
   
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case category = "category"
        case picture = "picture"
        case services = "services"

    }
}
    
    extension Profile: Equatable {
        static func ==(lhs: Profile, rhs: Profile) -> Bool {
            return lhs.id == rhs.id
    }
}
