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

        let login = ViewController()
        
        func testShouldSucceedIfFieldsAreNotEmpty() {
            let result = login.fieldsShouldNotBeEmpty(email: "test@test.com", password: "test123")
            XCTAssertEqual(result, true)
        }
    
        func testShouldFailIfFieldsAreNotEmpty() {
            let result = login.fieldsAreEmpty(email: "", password: "")
            XCTAssertEqual(result, false)
    }

}
