//
//  SendMissionVC.swift
//  jamesBond
//
//  Created by rishabh.yadav on 6/1/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Firebase

class SendMissionVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detail: UITextField!
    @IBOutlet weak var chooseAgent: UIButton!
    
    var imagePicker = UIImagePickerController()
    var uniqueName = UUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let myImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = myImage
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }

   
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        }
    
    
    
    
    
    @IBAction func chooseAgentTapped(_ sender: Any) {
        
        chooseAgent.isEnabled = false
        
        
        let imagaToUpload = UIImageJPEGRepresentation(imageView.image!, 0.1)
        
        Storage.storage().reference().child("missionImages").child("\(uniqueName).jpg").putData(imagaToUpload!, metadata: nil) { (metadata, error) in
            if error != nil {
                print("nasty error in uploading the image")
                
            }else{
                self.performSegue(withIdentifier: "selectAgent", sender: metadata?.downloadURL()?.absoluteString)
            }
        }
        
        
        
        
        
}
    //passing data to select agents vc
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest  = segue.destination as! selectAgentsVC
        
        guest.uniquename = uniqueName
        guest.detail = detail.text!
        guest.imageURL = sender as! String
        
        
        
    }
   

}













