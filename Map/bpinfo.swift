//
//  bpinfo.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/28/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import MapKit
import AddressBook

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
    
    
    
}
