//
//  selectAgentsVC.swift
//  jamesBond
//
//  Created by rishabh.yadav on 6/1/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Firebase

class selectAgentsVC: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    
    
    var uniquename = ""
    var detail = ""
    var imageURL = ""
    
    var agents : [Agent] = []
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print("image URL is : \(imageURL)")
        
      tableView.dataSource = self
         tableView.delegate = self
        
        
        Database.database().reference().child("agents").observe(.childAdded) { (snapshot: DataSnapshot) in
            let agent = Agent()
            
            if let dictionary = snapshot.value as? NSDictionary{
                if let agentEmail = dictionary["email"] as? String{
                    agent.email = agentEmail
                }
            }
            
            agent.uid = snapshot.key
            self.agents.append(agent)
            self.tableView.reloadData()
            
            
            
        }
        
        

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = UITableViewCell()
        
        let agent = agents[indexPath.row]
        cell.textLabel?.text = agent.email
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let missionDict = ["uniquename" : uniquename,
                           "imageURL" : imageURL,
                           "details" : detail,
                           "from" : Auth.auth().currentUser?.email]
        
        let agent = agents[indexPath.row]
        
        Database.database().reference().child("agents").child(agent.uid).child("missions").childByAutoId().setValue(missionDict)
        
        navigationController?.popToRootViewController(animated: true)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
   
}
