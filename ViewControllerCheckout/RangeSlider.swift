//
//  UIControl.swift
//  ViewControllerCheckout
//
//  Created by Richard Boell on 14.05.16.
//  Copyright © 2016 RB & Comp. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSlider: UIControl {
    var minimumValue = 0.0
    var maximumValue = 384*2.54*2/326     // eigentlich will ich: return Double(bounds.height)*2.54/326, das funktioniert nur komischerweise nicht
    var lowerValue = 0.7
    var upperValue = 4.9

    
    let lowerThumbLayer = RangeSliderThumbLayer()
    let upperThumbLayer = RangeSliderThumbLayer()
    
    var thumbHeight: CGFloat {
        return CGFloat(bounds.height)
    }
    
    var previousLocation = CGPoint()
   
    
    
    //MARK: initialize Slider
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lowerThumbLayer.rangeSlider = self
        upperThumbLayer.rangeSlider = self
        
        lowerThumbLayer.backgroundColor = UIColor(white:1, alpha:0.7).CGColor
        layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.backgroundColor = UIColor(white:1, alpha:0.7).CGColor
        layer.addSublayer(upperThumbLayer)
        
        updateLayerFrames()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    
    
    //MARK: Track users touch gestures and update thumb values
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        previousLocation = touch.locationInView(self)
        
        // Hit test the thumb layers
        if lowerThumbLayer.frame.contains(previousLocation) {
            lowerThumbLayer.highlighted = true
        } else if upperThumbLayer.frame.contains(previousLocation) {
            upperThumbLayer.highlighted = true
        }
        
        return lowerThumbLayer.highlighted || upperThumbLayer.highlighted
    }
    
    func boundValue(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let location = touch.locationInView(self)
        
        // 1. Determine by how much the user has dragged
        let deltaLocation = Double(location.y - previousLocation.y)
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / Double(bounds.height)
        
        previousLocation = location
        
        // 2. Update the values
        if lowerThumbLayer.highlighted {
            lowerValue += deltaValue
            lowerValue = boundValue(lowerValue, toLowerValue: minimumValue, upperValue: upperValue)
        } else if upperThumbLayer.highlighted {
            upperValue += deltaValue
            upperValue = boundValue(upperValue, toLowerValue: lowerValue, upperValue: maximumValue)
        }
        
        // 3. Update the UI
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        updateLayerFrames()
        
        CATransaction.commit()
        
        sendActionsForControlEvents(.ValueChanged)
        
        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        lowerThumbLayer.highlighted = false
        upperThumbLayer.highlighted = false
    }
    
    
    
    //MARK: Apply thumb value changes to thumb positions
    
    func updateLayerFrames() {
        let lowerThumbCenter = CGFloat(positionForValue(lowerValue))
        
        lowerThumbLayer.frame = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: lowerThumbCenter)
        lowerThumbLayer.setNeedsDisplay()
        
        let upperThumbCenter = CGFloat(positionForValue(upperValue))
        
        upperThumbLayer.frame = CGRect(x: 0.0, y: upperThumbCenter, width: bounds.width, height: bounds.height - upperThumbCenter)
        upperThumbLayer.setNeedsDisplay()
    }
    
    // convert unit value to unit displayposition
    func positionForValue(value: Double) -> Double {
        return Double(bounds.height) * (value - minimumValue) / (maximumValue - minimumValue)
    }
    
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    
}
