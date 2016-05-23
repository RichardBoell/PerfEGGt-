//
//  Kochzeit.swift
//  ViewControllerCheckout
//
//  Created by Richard Boell on 15.05.16.
//  Copyright © 2016 RB & Comp. All rights reserved.
//

import Darwin

var altitude: Double = 0
var diameter: Double = 4.2
var texture: Double = 65.0
var initialTemperature: Double = 4.0

var airPressure: Double {
    return 1013.25*exp(-altitude/8000)
}

var boilingTemperature: Double {
    return 234.175*log(airPressure/6.1078)/(17.08085 - log(airPressure/6.1078))
}

var boilingTime: Double {
    return 0.16*diameter*diameter*log(2*(boilingTemperature - initialTemperature)/(boilingTemperature - texture))
}

var seconds: Int {
    return Int(round((boilingTime % 1)*60))
}

var minutes: Int {
    return Int(round(boilingTime - (boilingTime % 1)))
}
