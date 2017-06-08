//
//  TimerViewController.swift
//  ViewControllerCheckout
//
//  Created by Richard Boell on 15.05.16.
//  Copyright © 2016 RB & Comp. All rights reserved.
//

import UIKit

class timerViewController: UIViewController {
    
    @IBOutlet var boilingTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boilingTimeLabel.text = "\(minutes) min \(seconds) sec"
    }
    
    var time: Double = Double(60*minutes + seconds)
    var timerseconds: Int {
        return Int(round(time.truncatingRemainder(dividingBy: 60)))
    }
    var timerminutes: Int {
        return Int((time - Double(timerseconds))/60)
    }
    var timer = Timer()
    
    @IBAction func startTimer(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(timerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if time >= 1 {
            time -= 1
            boilingTimeLabel.text = "\(timerminutes) min \(timerseconds) sec"
        } else {
            time = 0
            boilingTimeLabel.text = "finito🙌"
        }
    }
    
    
}
