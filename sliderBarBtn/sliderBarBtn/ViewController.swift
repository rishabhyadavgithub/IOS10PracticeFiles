//
//  ViewController.swift
//  sliderBarBtn
//
//  Created by rishabh.yadav on 5/23/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 0
        label.text = String(slider.value)

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func sliderMoved(_ sender: Any) {
        
        label.text = String(slider.value)
    }

}

