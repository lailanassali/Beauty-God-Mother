//
//  Extension+Database.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
extension Database {
    static func fetchUserWithUID(uid: String, completion: @escaping (User) -> ()) {
            Database.database().reference().child("users").child(uid).observe(.value, with: { (snapshot) in
                guard let dictionary = snapshot.value as? [String:Any] else {return}
                let user = User(id: uid, dictionary: dictionary)
                completion(user)
            }) { (e) in
                print("Failed to fetch user:", e)
            }
    }
}

