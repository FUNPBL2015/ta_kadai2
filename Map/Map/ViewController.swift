//
//  ViewController.swift
//  Map
//
//  Created by Kudo Takuya on 2015/03/04.
//  Copyright (c) 2015年 Kudo Takuya. All rights reserved.
//

import UIKit

import MapKit


class ViewController: UIViewController , MKMapViewDelegate, CLLocationManagerDelegate{
    @IBOutlet weak var myMapView: MKMapView!
    var myLocationManager: CLLocationManager!


    @IBOutlet var detailButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Delegate をセット
        self.myMapView?.delegate = self

        var region:MKCoordinateRegion = self.myMapView!.region
        var location:CLLocationCoordinate2D
        = CLLocationCoordinate2DMake(41.842011,140.766987)
        region.center = location
        region.span.latitudeDelta = 0.05
        region.span.longitudeDelta = 0.05
        self.myMapView!.setRegion(region,animated:true)
        
        myLocationManager = CLLocationManager()
        
        myLocationManager.delegate = self
        myLocationManager.distanceFilter = kCLHeadingFilterNone
        myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
      
        myLocationManager.startUpdatingLocation()
        
        
        
        var myPin: MKPointAnnotation = MKPointAnnotation()
        myPin.coordinate = location
        myPin.title = "公立はこだて未来大学"
        myPin.subtitle = "亀田中野町116番地2"
        myMapView.addAnnotation(myPin)
        
    }
    
   
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        myMapView.showsUserLocation = true
        
    }
   
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinColor = .Purple
            
            var rightButton: AnyObject! = UIButton.buttonWithType(UIButtonType.DetailDisclosure)
            pinView!.rightCalloutAccessoryView = detailButton
    
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    
    
    @IBAction func detailButton(sender: AnyObject) {
        //SVProgressHUD.showWithStatus("loading...", maskType: SVProgressHUDMaskType.None)
        SVProgressHUD.show()
        SVProgressHUD.showWithStatus("読み込み中")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

