//
//  RegistrationService.swift
//  Beauty God Mother
//
//  Created by Laila on 18/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

class RegistrationService {
    
    static var shared = RegistrationService()
    
    
    func passwordMatches(p1:String, p2:String) -> Bool {
        if p1 == p2 {
            return true
        } else { print("PASSWORD DO NOT MATCH!");return false }
    }
    
    public func nameFormatIsCorrect(name: String) -> Bool {
        if name.count <= 20 {
            return true
        } else { print("NAME MUST BE LESS THAN OR EQUAL TO 20 CHARACTERS");return false }
    }
    
    public func usernameFormatIsCorrect(username: String) -> Bool {
        if username.count > 3 && username.count <= 20 {
            return true
        } else { print("NAME MUST BE MORE THAN 3 OR LESS THAN EQUAL 20");return false }
    }
    
    // email function needed and tested.
    
    
}
