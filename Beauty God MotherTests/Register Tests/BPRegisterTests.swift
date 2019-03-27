//
//  BPRegisterTests.swift
//  Beauty God MotherTests
//
//  Created by aishat alonge on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import XCTest
import Firebase
@testable import Beauty_God_Mother



class BPRegisterTests: XCTestCase {
    var viewController: SPViewController!
    let registerService = RegistrationService.shared

   
    func testShouldSucceedIfContactFieldsAreNotEmpty() {
    
        let result = registerService.contactFieldsAreNotEmpty(name: "aisha", address: "aisha", postcode: "aisha", contactNumber: "aisha")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailIfContactFieldsAreEmpty() {
        
       let result = registerService.contactFieldsAreNotEmpty(name: "", address: "", postcode: "", contactNumber: "")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedIfServicesFieldsAreNotEmpty() {

        let result = registerService.servicesFieldsAreNotEmpty(name: "aisha", price: 20, duration: "aisha", description: "aisha")
        XCTAssertEqual(result, true)

    }

    func testShouldFailIfServicesFieldsAreEmpty() {

        let result = registerService.servicesFieldsAreNotEmpty(name: "", price: nil, duration: "", description: "")
        XCTAssertEqual(result, false)
    }
    


    
    
    
    

    //    func testShouldFailIfImageIsEmpty() {
    //        let result = registerService.imageIsNotEmpty(image: nil)
    //        XCTAssertEqual(result, false)
    //    }
    //
    
    
    
    //    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
