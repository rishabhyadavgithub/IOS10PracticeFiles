//
//  ViewController.swift
//  SideMenu
//
//  Created by rishabh.yadav on 7/25/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false

    override func viewDidLoad() {
              super.viewDidLoad()
        
         leadingConstraint.constant = -220
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openTapped(_ sender: Any) {
        
        if menuShowing
        {
        
            leadingConstraint.constant = -220
            
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        
        }else
            {
            
            leadingConstraint.constant = 0
                
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
    
        menuShowing = !menuShowing
}
}
