//
//  ViewController.swift
//  webViewDemo
//
//  Created by rishabh.yadav on 5/25/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
//          let url = URL(string: "https://www.google.co.in/?           client=safari&channel=mac_bm&gws_rd=cr&ei=BHwmWcmQG8XQ0gTTtY2oBw")
        
  //      webView.loadRequest(URLRequest(url:url!))
    
        

        // you will never do things like this ever
        //cocoaPods are here now
        if let url = URL(string: "https://www.google.co.in/?client=safari&channel=mac_bm&gws_rd=cr&ei=BHwmWcmQG8XQ0gTTtY2oBw"){
            
            let request = NSMutableURLRequest(url: url)
            
            let job = URLSession.shared.dataTask(with: request as URLRequest){
                
                result, response, error in
                
                if error != nil {
                    print(error)
                }else {
                    if let data = result {
                        let actualData = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                        
                        print(actualData)
                    }
                }
            }
            
            job.resume()
        }
        print("hello world")
        
    }

   

}

