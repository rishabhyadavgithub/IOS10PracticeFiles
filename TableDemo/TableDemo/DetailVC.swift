//
//  DetailVC.swift
//  TableDemo
//
//  Created by rishabh.yadav on 5/24/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var hero = "Empty"
    
    
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = hero
    }

   

}
