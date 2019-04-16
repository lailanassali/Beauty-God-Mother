//
//  RegisterTests.swift
//  Beauty God MotherTests
//
//  Created by Laila on 13/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import XCTest
import Firebase
@testable import Beauty_God_Mother
//BeautyGodMother
class CustomerRegisterTests: XCTestCase {
    
    let registerBuyer = RBViewController()
    
    func testShouldSucceedToRegisterWithPasswordsThatAreTheSame() {
        let result = registerBuyer.passwordMatches(password: "0000", confirmPassword: "0000")
        XCTAssertEqual(result, true)
    }
    
        func testShouldFailToRegisterWithPasswordsThatAreNotTheSame() {
            let result = registerBuyer.passwordMatches(password: "123444", confirmPassword: "1134")
            XCTAssertEqual(result, false)
        }
    
    func testShouldSucceedToRegisterIfNameIsMoreThan3Characters() {
       let result = registerBuyer.nameFormatIsCorrect(name: "laila")
       XCTAssertEqual(result, true)
    }

  func testShouldFailToRegisterIfNameIsMoreThan20Characters() {
        let result = registerBuyer.nameFormatIsCorrect(name: "abcdefghijklmnopqrstuvwxyz")
        XCTAssertEqual(result, false)

        }
    
    
    }

