//
//  GymMapViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit
import MapKit


class GymMapViewController: UIViewController {
    @IBOutlet weak var mpKit: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.261253, longitude: 75.706068),span : MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        mpKit.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 31.261253, longitude: 75.706068)
        annotation.title = "Gym"
        mpKit.addAnnotation(annotation)
        
    }
    


}
