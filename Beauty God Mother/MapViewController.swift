//
//  MapViewController.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 1/20/19.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D?
    
    @IBOutlet weak var MapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()

        
    }
    private func configureLocationServices() {
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
    } else  if status == .authorizedAlways || status == .authorizedWhenInUse{
        beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates (locationManager: CLLocationManager){
        MapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D ){
        
        let region = MKCoordinateRegion (center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        MapView.setRegion(region, animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
        [CLLocation]) {
        print("DID GET LATEST LOCATION")
        
        guard let latestLocation = locations.first else {return}
        
        if currentLocation == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            
        }
        currentLocation = latestLocation.coordinate
    }
private func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus){
        print("The status changed")
    if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationManager: manager)
        }
    }
}
