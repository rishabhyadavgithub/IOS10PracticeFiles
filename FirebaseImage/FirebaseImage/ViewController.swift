//
//  ViewController.swift
//  FirebaseImage
//
//  Created by rishabh.yadav on 5/27/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let storageReference = Storage.storage().reference()
        
        let tempImage = storageReference.child("images/myImage.jpg")
        
        //code to upload the image
        
        let image = UIImage(named: "testImage.jpg")
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        tempImage.putData(UIImageJPEGRepresentation(image!, 0.2)!, metadata: metaData) { (data, error) in
            if error == nil {
                print("Upload is done")
                
            } else{
                print(error?.localizedDescription)
            }
        }
        
    }
    
    
    
    
}

