//
//  ViewController.swift
//  kinder
//
//  Created by rishabh.yadav on 5/25/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var swipeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //code for right swipe
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped))
        
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        
        self.view.addGestureRecognizer(rightSwipe)
        
        
        //code for left swipe
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped))
        
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(leftSwipe)
        
        
    }
    
    func swiped(gesture: UISwipeGestureRecognizer){
        
        if let swipeDetected = gesture as? UISwipeGestureRecognizer{
            
            switch swipeDetected.direction{
            case UISwipeGestureRecognizerDirection.left:
                
                swipeLabel.text = "💔"
                
            case UISwipeGestureRecognizerDirection.right:
                
                 swipeLabel.text = "❤️"
                
            default:
                break
                
            }
            
            
            
            
            
        }
        
        
        
    }

   
}

