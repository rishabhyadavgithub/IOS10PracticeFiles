//
//  ViewController.swift
//  AudioRecorderTest
//
//  Created by rishabh.yadav on 5/25/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //GLOBAL variables for audio video
    var player : AVAudioPlayer?
    var recorder : AVAudioRecorder? = nil
    
    //URL to save audio video files
    var audioUrl : URL?
    
    
    @IBOutlet weak var recordLbl: UIButton!
    @IBOutlet weak var playLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //call setting function here
        audioSettings()
    }

    @IBAction func recordPressed(_ sender: Any) {
        
        if recorder!.isRecording{
            recorder!.stop()
            recordLbl.setTitle("Record", for: [])
            
        }else{
            recorder!.record()
            recordLbl.setTitle("Stop", for: [])
        }
        
    }
    
    @IBAction func playPressed(_ sender: Any) {
        
        
        do {
            try player = AVAudioPlayer(contentsOf: audioUrl!)
            player?.play()
        } catch  {
            print("problem in playing audio")
        }
        
        
        
    }
    
    func audioSettings(){
        
        do {
            //create an audio session
            
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            
            //store data at some location: URL
            
            let path : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            let pathAttributes = [path,"myAudio.m4a"]
            audioUrl = NSURL.fileURL(withPathComponents: pathAttributes)
            
            
            //attributes setting : FORMAT , SAMPLERATE , CHANNEL ..etc
            
            var settings : [String: AnyObject] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject?
            settings[AVSampleRateKey] = 44100.0 as AnyObject?
            settings[AVNumberOfChannelsKey] = 2 as AnyObject?
            
            
            //create recorder object
            
            recorder = try AVAudioRecorder(url: audioUrl!, settings: settings)
            recorder!.prepareToRecord()

            
        } catch let error as NSError{
            print(error)
        }
        
        
    }
    
    
   }

