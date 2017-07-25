//
//  ViewController.swift
//  weatherJson
//
//  Created by rishabh.yadav on 6/28/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?id=2172797&appid=b1b15e88fa797225412429c1c50c122a1")
     
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("error")
                
            }else
            {
                if let content = data {
                    do{
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        
                       
                        // longitude from coor dict
                        if let coord = myJson["coord"] as? NSDictionary
                        {
                            //print(rates)
                            
                            //to fetch inside elements of rates dictionary
                            if let lon = coord["lon"] as AnyObject?
                            {
                                print(lon)
                            }
                        }
                        
                        
                        //temp (inside main dict)
                        if let main = myJson["main"] as? NSDictionary
                        {
                            if let temp = main["temp"] as AnyObject?{
                                print(temp)
                            }
                        }
                        
                        // base
                        if let base = myJson["base"] as AnyObject?{
                            print(base)
                        }
                        
                        
                        // wind speed from wind dict
                        if let wind = myJson["wind"] as? NSDictionary{
                            if let speed = wind["speed"] as AnyObject?{
                                print(speed)
                            }
                        }
                        
                        
                        
                        // fetching data from weather array with multiple dictionaries
                        if let weather = myJson["weather"] as! NSArray?
                        {
                        
                            
                            if let first = weather[0] as? NSDictionary{
                            //print(first)
                               
                                if let id = first["id"] as AnyObject?{
                                    print(id)
                                }
                                
                                
                                if let main = first["main"] as AnyObject?{
                                    print(main)
                                }
                                
                                if let description = first["description"] as AnyObject?{
                                    print(description)
                                }
                                
                                
                                if let icon = first["icon"] as AnyObject?{
                                    print(icon)
                                }
                                
                            }
                        }

                        
                        
    
                        
                    }
                    catch{
                        
                        print("error 2")
                        
                    }
                }
            }
        
    }

    
 task.resume()
    }

}

