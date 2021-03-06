//
//  MapViewController.swift
//  FoodPin
//
//  Created by Even201314 on 16/5/15.
//  Copyright © 2016年 Even. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{
    @IBOutlet var mapView: MKMapView!
    
    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {
        placemarks, error in
            if error != nil{
                print(error)
                return
            }
            
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
        
        mapView.delegate = self
        
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation){
            return nil
        }
        
        var annotaitonView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        if annotaitonView == nil{
            annotaitonView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotaitonView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(data: restaurant.image!)
        annotaitonView?.leftCalloutAccessoryView = leftIconView
        annotaitonView?.pinTintColor = UIColor.orangeColor()
        
        return annotaitonView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
