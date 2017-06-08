//
//  ViewController.swift
//  coffeeApp
//
//  Created by rishabh.yadav on 5/23/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var payPrice: UILabel!

    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        inputText.layer.cornerRadius = 15.0
        
    }

   
    @IBAction func calculateTapped(_ sender: Any) {
       
        if inputText.text == ""{
            
           errorLabel.text = "Enter value in Box"
            
        }else{
        
        let input = Double(inputText.text!)
        
        payPrice.text = "$ \(input! * 5.0)"
        
        }
    }


}

