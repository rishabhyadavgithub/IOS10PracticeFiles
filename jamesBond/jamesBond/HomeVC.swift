//
//  HomeVC.swift
//  jamesBond
//
//  Created by rishabh.yadav on 6/1/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var missions : [Missions] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        //get data from firebase
        Database.database().reference().child("agents").child(Auth.auth().currentUser!.uid).child("missions").observe(.childAdded) { (snapshot : DataSnapshot) in
            
            let mission = Missions()
            
            
            //store data in missions array
            
            if let dictionary = snapshot.value as? NSDictionary{
                
                if let imgURL = dictionary["imageURL"] as? String{
                    mission.imageURL = imgURL
                }
                if let frm = dictionary["from"] as? String{
                    mission.from = frm
                }
                if let detl = dictionary["detail"] as? String{
                    mission.detail = detl
                }
                if let uniName = dictionary["uniquename"] as? String{
                    mission.uniqueName = uniName
                }
                mission.key = snapshot.key
            
            }
            
            self.missions.append(mission)
            self.tableView.reloadData()
            
            
        }
        
        
        
        Database.database().reference().child("agents").child(Auth.auth().currentUser!.uid).child("missions").observe(.childRemoved, with: { (snapshot) in
            
            var arrayKey = 0
            for mission in self.missions{
                if mission.key == snapshot.key{
                    self.missions.remove(at: arrayKey)
                }
                arrayKey += 1
            }
            
            self.tableView.reloadData()
            
        })
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let mission = missions[indexPath.row]
        
        cell.textLabel?.text = mission.uniqueName
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mission = missions[indexPath.row]
        
        performSegue(withIdentifier: "viewMissionSegue", sender: mission)
            }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewMissionSegue" {
            
            let guest = segue.destination as! missionDetailVC
            guest.missions = sender as! Missions
        }
    }
    
        
        
        
        
        
    }
    
   

  

