//
//  NewControlViewController.swift
//  ViewControllerCheckout
//
//  Created by Richard Boell on 14.05.16.
//  Copyright © 2016 RB & Comp. All rights reserved.
//

import UIKit

class diameterViewController: UIViewController {
    let rangeSlider = RangeSlider(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rangeSlider.backgroundColor = UIColor(white:0.2 , alpha: 0)
        view.addSubview(rangeSlider)
        
        rangeSlider.addTarget(self, action: #selector(diameterViewController.rangeSliderValueChanged(_:)), for: .valueChanged)
        
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 70.0
        let bottommargin: CGFloat = 30.0
        let width = view.bounds.width
        let height = view.bounds.height - topLayoutGuide.length - margin - bottommargin
        rangeSlider.frame = CGRect(x: 0.0, y: margin + topLayoutGuide.length, width: width, height: height)
        
       /* let upperFrame = CGRectMake(0, self.topLayoutGuide.length, width, margin)
        let lowerFrame = CGRectMake(0, view.bounds.height - margin, width, margin)
        let upperRectangle = UIView(frame: upperFrame)
        let lowerRectangle = UIView(frame: lowerFrame)
        upperRectangle.backgroundColor = UIColor(white:1, alpha:0.7)
        lowerRectangle.backgroundColor = UIColor(white:1, alpha:0.7)   //eigentlich will ich die exakte Color wie der Slider, aber ich bekomm die Konvertierung mit CGColor nicht hin
        self.view.addSubview(upperRectangle)
        self.view.addSubview(lowerRectangle)*/
    }
    
    func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        diameter = round(10*(rangeSlider.upperValue - rangeSlider.lowerValue))/10
        diameterText.text = "\(diameter) cm"

    }
    
    @IBOutlet var diameterText: UILabel!

    
    
    
}
