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
        
        private let regionRadius: CLLocationDistance = 10000
        func zoomMap(location:CLLocation)
        {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                mapview.setRegion(region , animated: true)
        }
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
       let location = locations.last!

    }
}

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
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! bpinfo
        let launch = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launch)
    }
    }




//
//    private let locationManager = CLLocationManager()
//    private var currentLocation: CLLocationCoordinate2D?
//
//    private var destinations: [MKPointAnnotation] = []
//    private var currentRoute: MKRoute?
//    var user: User?
//
//
//
//
//  //      checkIfUserIsLoggedIn()
//  //      fetchUser()
//        MapView.delegate = self
//
//        configureLocationServices()
//
//   }
//
////    @IBAction func logoutNow(_ sender: Any) {
////        do {
////            try Auth.auth().signOut()
////            dismiss(animated: true, completion: nil)
////        } catch let e {
////            print("Failed to logout",e)
////        }
////    }
////    fileprivate func fetchUser() {
////        guard let id = Auth.auth().currentUser?.uid else {return}
////        Database.database().reference().child("users").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
////            guard let dictionary = snapshot.value as? [String:Any] else {return}
////            let user = User(id: id, dictionary: dictionary)
////
////
////        }) { (err) in
////            print("Failed to fetch user: ", err)
////        }
////    }
////
////    fileprivate func checkIfUserIsLoggedIn(){
////        if Auth.auth().currentUser?.uid == nil {
////            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0) {
////                self.logout()
////            }
////        }
////    }
////
////
////    fileprivate func logout() {
////        do {
////            try Auth.auth().signOut()
////            performSegue(withIdentifier: "mainToLogin", sender: self)
////        } catch let e {
////            print("Failed to logout",e)
////        }
//    }
//    private func configureLocationServices() {
//        locationManager.delegate = self
//        let status = CLLocationManager.authorizationStatus()
//
//        if status == .notDetermined {
//            locationManager.requestAlwaysAuthorization()
//    } else  if status == .authorizedAlways || status == .authorizedWhenInUse{
//        beginLocationUpdates(locationManager: locationManager)
//        }
//    }
//
//    private func beginLocationUpdates (locationManager: CLLocationManager){
//        MapView.showsUserLocation = true
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.startUpdatingLocation()
//    }
//
//    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D ){
//
//        let region = MKCoordinateRegion (center: coordinate, latitudinalMeters: 5500, longitudinalMeters: 5500)
//        MapView.setRegion(region, animated: true)
//    }
//
//    private func addAnnotions() {
//    let laidByTiff = MKPointAnnotation()
//    laidByTiff.title = "laidByTiff"
//    laidByTiff.coordinate = CLLocationCoordinate2D(latitude: 51.287750, longitude: 1.093652)
//
//
//    let nailsByAisha = MKPointAnnotation()
//    nailsByAisha.title = "nailsByAisha"
//    nailsByAisha.coordinate = CLLocationCoordinate2D(latitude: 51.307794, longitude: 1.068223)
//
//    let hairByLaila = MKPointAnnotation ()
//    hairByLaila.title = "hairByLaila"
//    hairByLaila.coordinate = CLLocationCoordinate2D(latitude: 51.294494, longitude: 1.091007)
//
//    let shanjuNails = MKPointAnnotation ()
//    shanjuNails.title = "shanjuNails"
//    shanjuNails.coordinate = CLLocationCoordinate2D(latitude: 51.294793, longitude: 1.083423)
//
//
//    MapView.addAnnotation(laidByTiff)
//    MapView.addAnnotation(nailsByAisha)
//    MapView.addAnnotation(hairByLaila)
//    MapView.addAnnotation(shanjuNails)
//
// destinations.append(laidByTiff)
//        destinations.append(nailsByAisha)
//        destinations.append(hairByLaila)
//        destinations.append(shanjuNails)
//    }
//
//    private func constructRoute(userLocation: CLLocationCoordinate2D) {
//
//        let directionRequest = MKDirections.Request()
//        directionRequest.source = MKMapItem(placemark: MKPlacemark (coordinate: userLocation))
//        directionRequest.destination = MKMapItem(placemark: MKPlacemark (coordinate: destinations[1].coordinate))
//        directionRequest.requestsAlternateRoutes = true
//        directionRequest.transportType = .walking
//
//        let direction = MKDirections(request: directionRequest)
//        direction.calculate { [weak self ](directionResponse, error) in
//            guard let strongSelf = self else { return }
//
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let response = directionResponse, response.routes.count > 0 {
//
//                strongSelf.currentRoute = response.routes[0]
//                strongSelf.MapView.addOverlay(response.routes[0].polyline)
//                strongSelf.MapView.setVisibleMapRect(response.routes[0].polyline.boundingMapRect, animated: true)
//        }
//    }
//    }
//
//}
//
//extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
//        [CLLocation]) {
//        print("DID GET LATEST LOCATION")
//
//        guard let latestLocation = locations.first else {return}
//
//        if currentLocation == nil {
//            zoomToLatestLocation(with: latestLocation.coordinate)
//            addAnnotions()
//            constructRoute(userLocation: latestLocation.coordinate)
//
//        }
//        currentLocation = latestLocation.coordinate
//    }
//private func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus){
//        print("The status changed")
//    if status == .authorizedAlways || status == .authorizedWhenInUse{
//            beginLocationUpdates(locationManager: manager)
//        }
//    }
//}
//extension MapViewController: MKMapViewDelegate {
//
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKPolylineRenderer (overlay: overlay)
//        renderer.strokeColor = UIColor.purple
//        renderer.lineWidth = 5
//
//        return renderer
//    }
//
//    }
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
//        }
//
//             if let title = annotation.title, title == "laidByTiff" {
//            annotationView?.image = UIImage( named: "HAIR")
//        } else if let title = annotation.title, title == "nailsByAisha"{
//            annotationView?.image = UIImage ( named: "NAIL")
//        } else if let title = annotation.title, title == "hairByLaila" {
//            annotationView?.image = UIImage( named: "HAIR")
//        } else if let title = annotation.title, title == "shanjuNails"{
//           annotationView?.image = UIImage ( named: "NAIL")
//        }
//        else if annotation === mapView.userLocation {
//        annotationView?.image = UIImage (named: "SELF")
//        }
//
//
//        annotationView?.canShowCallout = true
//
//        return annotationView
//    }
//
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        print (" The annotation was selected: \(String(describing: view.annotation?.title))")
//    }

