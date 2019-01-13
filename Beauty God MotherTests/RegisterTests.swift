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
    
    func testFalse() {
        let result = viewController.verifyPasswords(p1: "1234", p2: "1134")
        XCTAssertEqual(result, false)
    }
    
    func testTrue() {
        let result = viewController.verifyPasswords(p1: "0000", p2: "0000")
        XCTAssertEqual(result, true)
    }
    
    
}
