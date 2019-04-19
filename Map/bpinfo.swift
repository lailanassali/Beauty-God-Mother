//
//  bpinfo.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/28/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import MapKit
import Contacts
import SwiftyJSON

class bpinfo: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String?, coordinate: CLLocationCoordinate2D){
        
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
        
    }
    
    var subtitle: String? {
        return locationName
    
    }
    
    // Calling information from profile.json -> to follow  bp.info format, wasn't working so it was commented out 
    
    
//    class func from(json: JSON) -> bpinfo? {
//        var title: String
//        if let unwrappedName = json["name"].string {
//            title = unwrappedName }
//        else {
//            title = ""
//        }
    
//        let locationName = json["address"].string
//        let latitude = json["latitude"].doubleValue
//        let longitude = json["longitude"].doubleValue
//        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        return bpinfo(title: title, locationName: locationName, coordinate: coordinate)
//    }
    func mapItem() -> MKMapItem{
        let addressDictionary = [String(CNPostalAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary as [String : Any])
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(String(describing: title)) \(String(describing: subtitle))"
        return mapItem
    }
}
