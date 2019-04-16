//
//  BPRegisterTests.swift
//  Beauty God MotherTests
//
//  Created by aishat alonge on 26/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import XCTest
import UIKit
import Firebase
@testable import Beauty_God_Mother

class BPRegisterTests: XCTestCase {
    let providerDetails = SPViewController()
    let registerService = RegistrationService.shared
    let contactDetails = ContactDetailsViewController()
    let serviceDetails = ServicesViewController()
    let profileDetails = profilePictureViewController()
    
    func testShouldSucceedIfNameFormatIsLessThanEqualTo20Characters() {
        let result = providerDetails.nameFormatIsCorrect(name: "tiffany")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailIfNameFormatIsMoreThan20Characters() {
        let result = providerDetails.nameFormatIsCorrect(name: "nbghytesdfghtyujklopih")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedIfPasswordMatches(){
        let result = providerDetails.passwordMatches(password: "tiffany123", confirmPassword: "tiffany123")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailIfPasswordDoesntMatches(){
        let result = providerDetails.passwordMatches(password: "laila45", confirmPassword: "tiffany1")
    XCTAssertEqual(result, false)
    }
   
    func testShouldSucceedIfFieldsAreNotEmpty() {
        
        let result = providerDetails.fieldsAreNotEmpty(name: "aisha", password: "laila", confirmPassword: "laila", email: "aisha@hotmail.com")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailIfFieldsAreEmpty() {
        
        let result = providerDetails.fieldsAreNotEmpty(name: "", password: "", confirmPassword: "", email: "")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedIfContactFieldsAreNotEmpty() {
    
        let result = contactDetails.fieldsAreNotEmpty(organisationName: "LaidByTIFF", city: "Canterbury", postcode: "CT1 1PS", contactNumber: "07706565787")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailIfContactFieldsAreEmpty() {
        
        let result = contactDetails.fieldsAreNotEmpty(organisationName: "", city: "", postcode: "", contactNumber: "")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedIfPostcodeIs7Or8CharactersLong() {
        
        let result = contactDetails.postcodeMustBe7Or8CharactersLong(postcode: "ct1 1pa")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailIfPostcodeIs7Or8CharactersLong() {
        
        let result = contactDetails.postcodeMustBe7Or8CharactersLong(postcode: "ct123 1pa")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedIfContactNumberIs11CharactersLong() {
        
        let result = contactDetails.contactNumberMustBe11CharactersLong(contactNumber: "07985490237")
        XCTAssertEqual(result, true)
    }
    
    func testShouldFailIfContactNumberIsLessThanOrMoreThan11CharactersLong() {
        
        let result = contactDetails.contactNumberMustBe11CharactersLong(contactNumber: "07901")
        XCTAssertEqual(result, false)
    }
    
    func testShouldSucceedIfServicesFieldsAreNotEmpty() {

        let result = serviceDetails.fieldsAreNotEmpty(nameOfService: "Hair", price: "20", duration: "1:20", description: "Highlights and Lowlights")
        XCTAssertEqual(result, true)

    }

    func testShouldFailIfServicesFieldsAreEmpty() {
        let result = serviceDetails.fieldsAreNotEmpty(nameOfService: "", price: "", duration: "", description: "")
        XCTAssertEqual(result, false)
    }
    
//    func testShouldSucceedIfUserUploadsAProfilePicture() {
//        let imageObject = UIImageView()
//        let image: UIImage? = UIImage(named: "profileImage.jpeg")
//
//        imageObject.image = image
//
//
//
//        let result = profileDetails.imageIsSelected(profilePicture: imageObject)
//        XCTAssertEqual(result, true)
//    }
    
    func testShouldFailIfUserDoesNotUploadAProfilePicture() {
      let imageObject = UIImageView()
      imageObject.image = nil
    
      let result = profileDetails.imageIsSelected(profilePicture: imageObject)
      XCTAssertEqual(result, false)
    }
}
