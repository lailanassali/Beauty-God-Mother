//
//// MapViewController.swift
//// Beauty God Mother
//// Created by Jessica Owusu on 1/20/19.
//// Copyright © 2019 BGM. All rights reserved.
//
//import UIKit
//import MapKit
//import Firebase
//
//
//class MapViewController: UIViewController {
//    
//}
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
//    override func viewDidLoad() {
//       super.viewDidLoad()
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
//        destinations.append(laidByTiff)
//        destinations.append(nailsByAisha)
//        destinations.append(hairByLaila)
//        destinations.append(shanjuNails)
//
//    MapView.addAnnotation(laidByTiff)
//    MapView.addAnnotation(nailsByAisha)
//    MapView.addAnnotation(hairByLaila)
//    MapView.addAnnotation(shanjuNails)
//
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
