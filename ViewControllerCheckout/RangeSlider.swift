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
    var maximumValue = 1.0
    var lowerValue = 0.2
    var upperValue = 0.8
    
    let trackLayer = CALayer()
    let lowerThumbLayer = CALayer()
    let upperThumbLayer = CALayer()
    
    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
}
