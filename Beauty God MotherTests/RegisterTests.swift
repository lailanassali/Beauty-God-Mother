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
class RegisterTests: XCTestCase {
    var viewController: RBViewController!
    let registerService = RegistrationService.shared
    
    func testShouldFailToRegisterWithPasswordsThatAreNotTheSame() {
        let result = registerService.passwordMatches(p1: "1234", p2: "1134", viewController: viewController)
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedToRegisterWithPasswordsThatAreTheSame() {
        let result = registerService.passwordMatches(p1: "0000", p2: "0000", viewController: viewController)
        XCTAssertEqual(result, true)
    }
    
    func testShouldSucceedToRegisterIfNameIsMoreThan3Characters() {
        let result = registerService.nameFormatIsCorrect(name: "laila", viewController: viewController)
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailToRegisterIfNameIsMoreThan20Characters() {
        let result = registerService.nameFormatIsCorrect(name: "abcdefghijklmnopqrstuvwxyz", viewController: viewController)
        XCTAssertEqual(result, false)
        
        }
    
    func testShouldSucceedToRegisterIfUserameIsMoreThan3CharactersOrLessThanOrEqualTo20Characters() {
        let result = registerService.nameFormatIsCorrect(name: "laila", viewController: viewController)
        let result2 = registerService.nameFormatIsCorrect(name: "1234567891111111111", viewController: viewController)
        XCTAssertEqual(result, true)
        XCTAssertEqual(result2, true)
    }
    
    func testShouldFailToRegisterIfUserameIsLessThan3Characters() {
        let result = registerService.usernameFormatIsCorrect(username: "a", viewController: viewController)
        XCTAssertEqual(result, false)
    }

  //  func shouldSucceedToRegisterIfEmailIsValid() {
 //       let result = viewController.verifyEmail(email: "laila@hotmail.com")
    //    XCTAssertEqual(result, true)
        
  //  }
    
   // func shouldFailToRegisterIfEmailIsInvalid() {
  //      let result = viewController.verifyEmail(email: "aisha@yahoo")
   //     XCTAssertEqual(result, false)
    
 //   }
}
