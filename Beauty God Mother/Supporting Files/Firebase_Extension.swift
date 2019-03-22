//
//  Firebase_Extension.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 12/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import Foundation
import Firebase


extension Database {
    
    static func createUser() {
        let rs = RegistrationService.shared
        Auth.auth().createUser(withEmail: rs.email, password: rs.password) { (result:AuthDataResult?, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            //  Save id generated by Firebase
            guard let uid = result?.user.uid else {return}
            
            let ref = Storage.storage().reference(withPath: "/\(uid)/profileImage")
            let imageData = rs.profileImage.jpegData(compressionQuality: 0.5) ?? Data()
            ref.putData(imageData, metadata: nil, completion: { (_, e) in
                if let e = e {
                    print(e.localizedDescription)
                }
                print("Sucessfully uploaded image to storage")
                ref.downloadURL(completion: { (url, e) in
                    if let e = e {
                        print(e.localizedDescription)
                    }
                    
                    let urlString = url?.absoluteString ?? ""
                    saveToDatabase(uid: uid, imageUrl: urlString, completionHandler: {
                        print("Done and dusted")
                    })
                    
                })
            })
        }
    }
    
    
    static private func saveToDatabase(uid: String, imageUrl url: String, completionHandler: () -> ()) {
        let rs = RegistrationService.shared
        // Database Structure
        let dictionaryValues = [
            "name": rs.name ,
            "email": rs.email,
            "kind": "provider",
            "organisation name": rs.organisationName,
            "address": rs.address,
            "postcode": rs.postCode,
            "contact number": rs.contactNumber.null,
            "service name": rs.serviceName,
            "price": rs.price,
            "duration": rs.duration,
            "description": rs.description,
            "additional information": rs.additionalInformation.null,
            "profileImageURL": url,
            "bio": rs.bio.null,
            "instagram": rs.instagram.null ,
            "facebook": rs.facebook.null,
            "website": rs.website.null,
            "company type": rs.companyType.rawValue,
            "serviceType": rs.serviceType
            ] as [String : Any]
        // Save values to uid
        let values = [uid:dictionaryValues]
        Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            print("Sucessfully added \(rs.organisationName.null) to database!")
        })
    }
}



extension Optional where Wrapped == String {
    var null: String {
        return self ?? "null"
    }
}

extension Optional where Wrapped == Int {
    var null: Int {
        return self ?? 0
    }
}
