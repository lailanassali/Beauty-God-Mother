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
    var viewController: RBViewController!
    let registerService = RegistrationService.shared
    
    func testShouldFailToRegisterWithPasswordsThatAreNotTheSame() {
        let result = registerService.passwordMatches(p1: "123444", p2: "1134")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedToRegisterWithPasswordsThatAreTheSame() {
        let result = registerService.passwordMatches(p1: "0000", p2: "0000")
        XCTAssertEqual(result, true)
    }
    
    func testShouldSucceedToRegisterIfNameIsMoreThan3Characters() {
        let result = registerService.nameFormatIsCorrect(name: "laila")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailToRegisterIfNameIsMoreThan20Characters() {
        let result = registerService.nameFormatIsCorrect(name: "abcdefghijklmnopqrstuvwxyz")
        XCTAssertEqual(result, false)
        
        }
    
    func testShouldSucceedToRegisterIfUserameIsMoreThan3CharactersOrLessThanOrEqualTo20Characters() {
        let result = registerService.nameFormatIsCorrect(name: "laila")
        let result2 = registerService.nameFormatIsCorrect(name: "1234567891111111111")
        XCTAssertEqual(result, true)
        XCTAssertEqual(result2, true)
    }
    
  /**  func testShouldFailToRegisterIfPasswordIsLessThan8Characters() {
        let result = registerService.passwordMustBe8Characters(p1: "12345678", p2: "12345678", viewController: viewController)
        let result2 = registerService.passwordMustBe8Characters(p1: "123", p2: "1256", viewController: viewController)
        XCTAssertEqual(result, false)
        XCTAssertEqual(result2, false)
    } **/
    
    
    }

  //  func shouldSucceedToRegisterIfEmailIsValid() {
 //       let result = viewController.verifyEmail(email: "laila@hotmail.com")
    //    XCTAssertEqual(result, true)
        
  //  }
    
   // func shouldFailToRegisterIfEmailIsInvalid() {
  //      let result = viewController.verifyEmail(email: "aisha@yahoo")
   //     XCTAssertEqual(result, false)
    
 //   }

