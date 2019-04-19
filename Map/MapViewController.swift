//
//// MapViewController.swift
//// Beauty God Mother
//// Created by Jessica Owusu on 1/20/19.
//// Copyright © 2019 BGM. All rights reserved.
//
import UIKit
import MapKit
import SwiftyJSON




    class MapViewController: UIViewController {
        @IBOutlet weak var mapview: MKMapView!

        override func viewDidLoad() {
            super.viewDidLoad()
        // maps initial location when opened
        let initialLocation = CLLocation(latitude: 51.2802, longitude: 1.0789 )
        zoomMap(location: initialLocation)
        
       // List of beauty providers and locations
        let list1 = bpinfo(title: "Beauty By Jess", locationName: "CT12YA", coordinate:CLLocationCoordinate2D(latitude: 51.274875,longitude: 1.080233))
        let list2 = bpinfo(title: "Laid By Tiff", locationName: "CT2 7RF", coordinate: CLLocationCoordinate2D(latitude: 51.287750, longitude: 1.093652))
        let list3 = bpinfo(title: "Hair By Lai", locationName: "CT2 7RF", coordinate: CLLocationCoordinate2D(latitude: 51.294494, longitude: 1.091007))
        let list4 = bpinfo(title: "Nails By Shanju", locationName: "CT2 7BY", coordinate: CLLocationCoordinate2D(latitude: 51.294793, longitude: 1.083423))
        let list5 = bpinfo(title: "Eyebrows By Aisha", locationName: "CT2 9NB", coordinate: CLLocationCoordinate2D(latitude: 51.307794, longitude: 1.068223))
            
        mapview.addAnnotation(list1)
        mapview.addAnnotation(list2)
        mapview.addAnnotation(list3)
        mapview.addAnnotation(list4)
        mapview.addAnnotation(list5)
            
            mapview.delegate = self
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            checkLocationStatus()
        }
        // where and how close map should zoom to
        
        private let regionRadius: CLLocationDistance = 10000
        func zoomMap(location:CLLocation)
        {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                mapview.setRegion(region , animated: true)
        }
        
        // get users location
        private let locationManager = CLLocationManager()
        func checkLocationStatus() {
            locationManager.delegate = self
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapview.showsUserLocation = true
                locationManager.startUpdatingLocation() // remove this
            } else {
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            }
    }
        
}

extension MapViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        _ = locations.last!

    }
}
// pin and adding directions options to pin
extension MapViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if let annotation = annotation as? bpinfo {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            
            }
            return view
        }
        return nil
    }
    
    // enabling map directions
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! bpinfo
        let launch = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launch)
    }
    }
