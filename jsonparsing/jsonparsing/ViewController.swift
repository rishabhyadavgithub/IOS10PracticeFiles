//
//  ViewController.swift
//  jsonparsing
//
//  Created by rishabh.yadav on 6/27/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    let url = URL(string: "https://api.adorable.io/avatars/list")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil{
                print("error")
            }else{
                
                if let content = data {
                    do{
                        
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary   //Anyobeject can be used as
                        
                        //print(myJson)
                        
                        if let face = myJson["face"] as! NSDictionary?
                        {
                            
                            if let nose = face["nose"] as! NSArray?
                            {
                                print(nose)
                                
//                                for i in 0..<3{
//                                    print(mouth[i])
//                                }
                            }
                        }
                        
                    }catch{
                        //catch error
                    }
                }
                
            }
            
        }
    task.resume()
    }

    

}

