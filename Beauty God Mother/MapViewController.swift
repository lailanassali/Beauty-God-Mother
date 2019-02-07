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
        
        MapView.delegate = self
        
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
        
        let region = MKCoordinateRegion (center: coordinate, latitudinalMeters: 5500, longitudinalMeters: 5500)
        MapView.setRegion(region, animated: true)
    }
    
    private func addAnnotions() {
    let laidByTiff = MKPointAnnotation()
    laidByTiff.title = "laidByTiff"
    laidByTiff.coordinate = CLLocationCoordinate2D(latitude: 51.287750, longitude: 1.093652)
    
    
    let nailsByAisha = MKPointAnnotation()
    nailsByAisha.title = "nailsByAisha"
    nailsByAisha.coordinate = CLLocationCoordinate2D(latitude: 51.307794, longitude: 1.068223)
        
    let hairByLaila = MKPointAnnotation ()
    hairByLaila.title = "hairByLaila"
    hairByLaila.coordinate = CLLocationCoordinate2D(latitude: 51.294494, longitude: 1.091007)
        
    let shanjuNails = MKPointAnnotation ()
    shanjuNails.title = "shanjuNails"
    shanjuNails.coordinate = CLLocationCoordinate2D(latitude: 51.294793, longitude: 1.083423)
        
    MapView.addAnnotation(laidByTiff)
    MapView.addAnnotation(nailsByAisha)
    MapView.addAnnotation(hairByLaila)
    MapView.addAnnotation(shanjuNails)
  
    }
        
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
        [CLLocation]) {
        print("DID GET LATEST LOCATION")
        
        guard let latestLocation = locations.first else {return}
        
        if currentLocation == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotions()
            
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
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
             if let title = annotation.title, title == "laidByTiff" {
            annotationView?.image = UIImage( named: "HAIR")
        } else if let title = annotation.title, title == "nailsByAisha"{
            annotationView?.image = UIImage ( named: "NAIL")
        } else if let title = annotation.title, title == "hairByLaila" {
            annotationView?.image = UIImage( named: "HAIR")
        } else if let title = annotation.title, title == "shanjuNails"{
           annotationView?.image = UIImage ( named: "NAIL")
        }
        else if annotation === mapView.userLocation {
        annotationView?.image = UIImage (named: "SELF")
        }
    

        annotationView?.canShowCallout = true
        
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print (" The annotation was selected: \(String(describing: view.annotation?.title))")
    }
}
