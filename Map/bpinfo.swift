//
//  bpinfo.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/28/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import MapKit
import AddressBook
import SwiftyJSON

class bpinfo: NSObject, MKAnnotation {
    
     let name: String?
    let location: String?
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, location: String?, coordinate: CLLocationCoordinate2D){
        
        self.name = name
        self.location = location
        self.coordinate = coordinate
        
        super.init()
        
    }
    
    var subtitle: String? {
        return location
    
    }
    
    // Calling information from profile.json -> to follow  bp.info format
    class func from(json: JSON) -> bpinfo? {
        var name: String
        if let unwrappedTitle = json["name"].string {name = unwrappedTitle }
        else {
            name = "" }
        
        let location = json["displayAddress"].string
        let lat = json["location"]["lat"].doubleValue
        let long = json["location"]["lng"].doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        return bpinfo(name: name, location: location, coordinate: coordinate)
    }
}
