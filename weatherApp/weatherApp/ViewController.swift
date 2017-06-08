//
//  ViewController.swift
//  weatherApp
//
//  Created by rishabh.yadav on 5/26/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
 //London,uk=
//


import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    var baseURL = "http://api.openweathermap.org/data/2.5/weather?q="
    var location = ""
    var getAPI = "&appid="
    var api = "a8a76286b30bb4a41a73856ccf60b239"
    
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var getWeather: UIButton!
    
    var temperature = 0.0
    var WeatherT = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWeather.isEnabled = false
        
        }

    @IBAction func getWeatherTapped(_ sender: Any) {
        
        let runningURL = "\(baseURL)\(cityTextField.text!)\(getAPI)\(api)"
        
        Alamofire.request(runningURL).responseJSON { (response) in
            print(response)
            
            let result = response.result
            
            //Get Data and update labels
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let webTemp = main["temp"] as? Double {
                        self.temperature = webTemp - 273.15
                        print(self.temperature)
                        self.temp.text = "Temperature is \(self.temperature)°"
                    }
                }
            }
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let webWeather = dict["weather"]![0] as? Dictionary<String, AnyObject> {
                    if let webMain = webWeather["main"] as? String {
                        self.WeatherT = webMain
                        print(self.WeatherT)
                        self.weatherType.text = "Weather is: \(self.WeatherT)"
                    }
                }
            }
            
            
        }
        
        
    }
   
    @IBAction func textFieldChanged(_ sender: Any) {
        
        if (cityTextField.text?.characters.count)! > 0{
            getWeather.isEnabled = true
            
        }else{
            getWeather.isEnabled = false
        }
    }

}

