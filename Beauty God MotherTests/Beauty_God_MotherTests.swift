//
//  Beauty_God_MotherTests.swift
//  Beauty God MotherTests
//
//  Created by Anisha  KATUMBA  on 04/01/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import XCTest
@testable import Beauty_God_Mother

class Beauty_God_MotherTests: XCTestCase {
    
    let sut = RBViewController()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIfRegisterIsEnabled() {
       
        XCTAssertEqual(sut.isEnabled, true)
}
    func testIfDisables(){
        sut.isDisabled()
        XCTAssertEqual(sut.isEnabled, false)
        
    }
}
