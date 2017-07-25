//
//  ViewController.swift
//  jsonTest
//
//  Created by rishabh.yadav on 5/25/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    var firstName = ""
    var idValue = ""
    var city = ""
    var gender = ""
    var phone = ""
    var postCode = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = "https://randomuser.me/api/"
        
        Alamofire.request(myURL).responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
            
            print(response)
            let result = response.result
            //get data and print it
            
            
            
            //fetching gender from results
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let gender = innerDictR["gender"] as? String{
                        self.gender = gender
                        print("###\(self.gender)")
                    }
                }
            }
            
            //fetching phone from results
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let phone = innerDictR["phone"] as? String{
                        self.phone = phone
                        print("###\(self.phone)")
                    }
                }
            }
            
            
            //fetching first from name
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let name = innerDictR["name"] as? Dictionary<String,AnyObject>{
                        if let first = name["first"] as? String {
                            self.firstName = first.capitalized
                            print(self.firstName)
                        }
                        
                        }
                    }
                }
            
            //fetching value from id
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let id = innerDictR["id"] as? Dictionary<String,AnyObject>{
                        if let webValue = id["first"] as? String {
                            self.idValue = webValue.capitalized
                            print(self.idValue)
                            }
                        
                    }
                }
            }
            
            //fetching city from location
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let location = innerDictR["location"] as? Dictionary<String,AnyObject>{
                        if let city = location["city"] as? String {
                            self.city = city.capitalized
                            print(self.city)
                        }
                        
                    }
                }
            }

            
        
        
        
        
            }
        }
        
    }

    




