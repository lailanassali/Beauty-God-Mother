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
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = (storyboard.instantiateViewController(withIdentifier: "RBViewController") as! RBViewController)
        UIApplication.shared.keyWindow!.rootViewController = viewController
        _ = viewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShouldFailToRegisterWithPasswordsThatAreNotTheSame() {
        let result = viewController.verifyPasswords(p1: "1234", p2: "1134")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedToRegisterWithPasswordsThatAreTheSame() {
        let result = viewController.verifyPasswords(p1: "0000", p2: "0000")
        XCTAssertEqual(result, true)
    }
    
    func testShouldSucceedToRegisterIfNameIsMoreThan3Characters() {
        let result = viewController.verifyName(name: "laila")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailToRegisterIfNameIsMoreThan20Characters() {
        let result = viewController.verifyName(name: "abcdefghijklmnopqrstuvwxyz")
        XCTAssertEqual(result, false)
        
        }
    
    func testShouldSucceedToRegisterIfUserameIsMoreThan3CharactersOrLessThanOrEqualTo20Characters() {
        let result = viewController.verifyName(name: "laila")
        let result2 = viewController.verifyName(name: "1234567891111111111")
        XCTAssertEqual(result, true)
        XCTAssertEqual(result2, true)
    }
    
    func testShouldFailToRegisterIfUserameIsLessThan3Characters() {
        let result = viewController.verifyUsername(username: "a")
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
