//
//  ViewController.swift
//  RunnerApp
//
//  Created by rishabh.yadav on 5/23/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    
    var buttonState = true
    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBtn.layer.cornerRadius = 15.0
        playBtn.layer.borderWidth = 2.0
        playBtn.layer.borderColor = UIColor.white.cgColor
    }

    
    @IBAction func playBtnTapped(_ sender: Any) {
        
        if buttonState {
            playBtn.setTitle("pause", for: [])
            buttonState = false
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.addToTime), userInfo: nil, repeats: true)
            
        }else{
            playBtn.setTitle("play", for: [])
            buttonState = true
            timer.invalidate()
        }
    }
   
    @IBAction func resetTapped(_ sender: Any) {
        
        timer.invalidate()
        time = 0
        timeLbl.text = "00"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.addToTime), userInfo: nil, repeats: true)
        
    }
  
    @IBAction func stopTapped(_ sender: Any) {
        
        timer.invalidate()
        time = 0
        timeLbl.text = "00"
        playBtn.setTitle("play", for: [])
    }

    
    func addToTime(){
        
        time += 1
        timeLbl.text = "\(time)"
    }
    
    
    
}

