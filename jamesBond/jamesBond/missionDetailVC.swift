//
//  missionDetailVC.swift
//  jamesBond
//
//  Created by rishabh.yadav on 6/1/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class missionDetailVC: UIViewController {
    
    
    var missions = Missions()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var missionDetails: UILabel!
    @IBOutlet weak var from: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  print("###\(missions.from)")
        

        missionDetails.text = missions.detail
        
        from.text = missions.from
        
        imageView.sd_setImage(with: URL(string: missions.imageURL))
    
    
    }

    @IBAction func denyMissionTapped(_ sender: Any) {
        
        //delete mission from database
        
        Database.database().reference().child("agents").child(Auth.auth().currentUser!.uid).child("missions").child(missions.key).removeValue()
        
        
        
        
        //delete images from storage
        Storage.storage().reference().child("missionImages").child("\(missions.uniqueName).jpg").delete { (error) in
            
            print("\(error?.localizedDescription)")
        }
        
        //pop the user to root vc
        navigationController?.popToRootViewController(animated: true)
        
        //reload the table view when child gets deleted (homeVC)
        
    }
  
}
