//
//  User.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import Foundation

struct User {
    enum Kind {case provider, customer}
    let id: String
    let name: String
    let email: String
    let kind: Kind
    let imageUrl: String
    
    init(id: String, dictionary: [String:Any]) {
        self.id = id
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        
        let kind = dictionary["kind"] as? String ?? ""
        switch kind {
        case "provider":
            self.kind = .provider 
        default:
            self.kind = .customer
        }
    }
}
