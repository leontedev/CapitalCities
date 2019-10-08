//
//  ViewController.swift
//  CapitalCities
//
//  Created by Mihai Leonte on 10/3/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics", url: "https://en.wikipedia.org/wiki/London")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", url: "https://en.wikipedia.org/wiki/Oslo")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.", url: "https://en.wikipedia.org/wiki/Paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.", url: "https://en.wikipedia.org/wiki/Rome")
        let washington = Capital(title: "Washington D.C.", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.", url: "https://en.wikipedia.org/wiki/Washington,_D.C.")
        let bucharest = Capital(title: "Bucharest", coordinate: CLLocationCoordinate2D(latitude: 44.4325, longitude: 26.103889), info: "Little Paris", url: "https://en.wikipedia.org/wiki/Bucharest")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington, bucharest])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Layer", style: .plain, target: self, action: #selector(selectLayer))
    }
    
    @objc func selectLayer() {
        
        let ac = UIAlertController(title: "Select Map Layer", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { (_) in
            self.mapView.mapType = .standard
        }))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { (_) in
            self.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { (_) in
            self.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: { (_) in
            self.mapView.mapType = .mutedStandard
        }))
        ac.addAction(UIAlertAction(title: "Satellite Flyover", style: .default, handler: { (_) in
            self.mapView.mapType = .satelliteFlyover
        }))
        present(ac, animated: true)
        
    }
    
    // Simillarly to the pattern of re-using table view cells.
    // We try to dequeue an Annotation View, however the first time around - it will not be there. So we need to check for nil and create a new MKPinAnnotationView.
    // We'll also add a info button - in the rightCalloutAccessoryView
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        if let reusedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            reusedAnnotationView.annotation = annotation
            return reusedAnnotationView
        } else {
            let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
            annotationView.pinTintColor = .systemBlue
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView.rightCalloutAccessoryView = btn
            return annotationView
        }
        
    }
    
    // Called when the button (rightCalloutAccesory) on the annotation view is tapped
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        let placeURL = capital.url
        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(ac, animated: true)
        
        let webView = WebViewController()
        webView.url = placeURL
        present(webView, animated: true)
    }

}

