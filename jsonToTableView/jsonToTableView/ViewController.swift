//
//  ViewController.swift
//  jsonToTableView
//
//  Created by rishabh.yadav on 6/27/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{
    
    var fetchedCountry = [Country]()
    
    @IBOutlet weak var countryTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
        parseData()
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return fetchedCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = fetchedCountry[indexPath.row].country
        cell?.detailTextLabel?.text = fetchedCountry[indexPath.row].capital
        
        return cell!
        
        }
    
   
    //parse json data
    
    func parseData(){
        
        fetchedCountry = []
        
        let url = "https://restcountries.eu/rest/v2/all"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if (error != nil) {
                print("error")
            }else{
                
                 do {
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)as! NSArray
                   // print(fetchedData)
                    
                    for eachFetchedCountry in fetchedData{
                        
                        let eachCountry = eachFetchedCountry as![String : AnyObject]
                        let country = eachCountry["name"] as! String
                         let capital = eachCountry["capital"] as! String
                        
                        self.fetchedCountry.append(Country(country: country, capital: capital))
                       
                    }
                    
                    self.countryTableView.reloadData()
                  // print(self.fetchedCountry)
                    
                }
                 catch{
                    print("error 2")
                }
            }
            
        }
        task.resume()
        
    }

    
}



class Country{
    var country : String
    var capital : String
    
    init(country:String,capital:String) {
        
        self.country = country
        self.capital = capital
    }
}











