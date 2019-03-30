//
//  DataProvider.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 28/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import Foundation

final class DataProvider {
    
    static let shared = DataProvider()
    
    private init() {
        // private
    }
    
    var allProfiles: [Profile] {
        guard let jsonData = read(from: "profile") else {
            fatalError("The app cannot work without profiles")
        }
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode([Profile].self, from: jsonData) else {
            fatalError("Invalid JSON data")
   }
        return decoded
        
    }
    
    var featuredProfile: Profile {
        let randomIndex = Int(arc4random_uniform(UInt32(allProfiles.count)))
        return allProfiles[randomIndex]
    }
    
    private func read(from path: String) -> Data? {
        guard let path = Bundle.main.path(forResource: path, ofType: "json") else {
            return nil
        }
        return try? Data(contentsOf: URL(fileURLWithPath: path))
    }
}

