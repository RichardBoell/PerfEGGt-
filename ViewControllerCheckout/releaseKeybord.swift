//
//  WeightViewController.swift
//  ViewControllerCheckout
//
//  Created by Richard Boell on 09.05.16.
//  Copyright © 2016 RB & Comp. All rights reserved.
//

import UIKit

class weightViewController: UIViewController {
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        if Float(diameterText.text!)! <= 4.5 && Float(diameterText.text!)! >= 0 {
            view.endEditing(true)
        }
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBOutlet var diameterSliderValue: UISlider!
    
    @IBOutlet var diameterSliderValue2: UISlider!
    
    @IBAction func updateDiameterText(sender: AnyObject) {
        diameterText.text = String(round((diameterSliderValue2.value - diameterSliderValue.value)/6.4)/10)
    }
    
    @IBAction func updateDiameterText2(sender: AnyObject) {
        diameterText.text = String(round((diameterSliderValue2.value - diameterSliderValue.value)/6.4)/10)
    }

    @IBOutlet var diameterText: UITextField!
    
    @IBAction func updateDiameterSliderValue(sender: AnyObject) {
        diameterSliderValue.value = 145-32*(Float(diameterText.text!)!)
        diameterSliderValue2.value = 145+32*(Float(diameterText.text!)!)
    }
}
