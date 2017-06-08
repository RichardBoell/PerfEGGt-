//
//  HeightViewController.swift
//  ViewControllerCheckout
//
//  Created by Richard Boell on 10.05.16.
//  Copyright © 2016 RB & Comp. All rights reserved.
//

import UIKit
import CoreLocation

class textureViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet var myAltitude: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myCurrentLoc = locations[locations.count - 1]
        altitude = Double(myCurrentLoc.altitude)
        myAltitude.text = "Your current altitude is: \(Int(altitude)) m"
        locationManager.stopUpdatingLocation()
    }
    
    
    @IBOutlet var textureSliderValue: UISlider!
    
    
    @IBAction func updateTextureValue(_ sender: AnyObject) {
        texture = Double(textureSliderValue.value)
    }
    
    @IBOutlet var switchState: UISwitch!
    
    @IBAction func updateInitialTemperature(_ sender: AnyObject) {
        if switchState.isOn {
            initialTemperature = 4.0
        } else {
            initialTemperature = 20.0
        }
    }
    
    
}
