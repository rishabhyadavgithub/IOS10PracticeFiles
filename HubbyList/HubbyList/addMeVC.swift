//
//  addMeVC.swift
//  HubbyList
//
//  Created by rishabh.yadav on 5/24/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class addMeVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var today: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func sendToHubbyTapped(_ sender: Any) {
        
       let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        
        
        let task = Task(context: context)
        
        if let name = textField.text{
            task.name = name
        }
            task.today = today.isOn
    
        //save data to core data
        guest.saveContext()
        
        navigationController?.popToRootViewController(animated: true)
        
    }
}

        
        
/* ------- Another method to add entry in core data -----
 
 
         if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
         
         restaurant = RestaurantModel(context: appDelegate.persistentContainer.viewContext)
         
         restaurant.name = name.text!
         restaurant.type = type.text!
         restaurant.location = location.text!
         restaurant.phone = phone.text!
         
         if let image = pickedImage.image{
         let imageData = UIImagePNGRepresentation(image)
         
         if let data = imageData{
         restaurant.image = NSData(data: data)
         }
         
         }
         
         appDelegate.saveContext()
         }
         
         dismiss(animated: true, completion: nil)
         }
 */
      
