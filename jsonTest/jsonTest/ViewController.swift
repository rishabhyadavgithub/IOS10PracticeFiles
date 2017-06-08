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
                    if let webGender = innerDictR["gender"] as? String{
                        self.gender = webGender
                        print("###\(self.gender)")
                    }
                }
            }
            
            //fetching phone from results
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let webPhone = innerDictR["phone"] as? String{
                        self.phone = webPhone
                        print("###\(self.phone)")
                    }
                }
            }
            
            
            //fetching first from name
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let nameD = innerDictR["name"] as? Dictionary<String,AnyObject>{
                        if let webFirst = nameD["first"] as? String {
                            self.firstName = webFirst.capitalized
                            print(self.firstName)
                        }
                        
                        }
                    }
                }
            
            //fetching value from id
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let iD = innerDictR["id"] as? Dictionary<String,AnyObject>{
                        if let webValue = iD["first"] as? String {
                            self.idValue = webValue.capitalized
                            print(self.idValue)
                            }
                        
                    }
                }
            }
            
            //fetching city from location
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDictR = dict["results"]![0] as? Dictionary<String,AnyObject>{
                    if let locationD = innerDictR["location"] as? Dictionary<String,AnyObject>{
                        if let webCity = locationD["city"] as? String {
                            self.city = webCity.capitalized
                            print(self.city)
                        }
                        
                    }
                }
            }

            
        
        
        
        
            }
        }
        
    }

    




