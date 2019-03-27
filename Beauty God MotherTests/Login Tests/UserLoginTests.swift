//
//  UserLoginTests.swift
//  Beauty God MotherTests
//
//  Created by Anisha  KATUMBA  on 27/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import XCTest
import UIKit
import Firebase
@testable import Beauty_God_Mother

class UserLoginTests: XCTestCase {

        let loginService = LoginService.shared
        
        func testShouldSucceedIfFieldsAreNotEmpty() {
            let result = loginService.fieldsShouldNotBeEmpty(email: "test@test.com", password: "test123")
            XCTAssertEqual(result, true)
        }
    
        func testShouldFailIfFieldsAreNotEmpty() {
            let result = loginService.fieldsShouldNotBeEmpty(email: "", password: "")
            XCTAssertEqual(result, false)
    }

}
