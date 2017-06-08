//
//  ViewController.swift
//  firebaseTest
//
//  Created by rishabh.yadav on 5/27/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var signUp: UIButton!
    
    
//var databaseReference = Database.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
    }

   
    @IBAction func signUpTapped(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
        
            if error != nil{
                self.errorMessage.text = error?.localizedDescription
            }else
            {
                //print a message for success
                self.errorMessage.text = "Registered Succesfully"
                
                //sign in user
                Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!, completion: { (user, error) in
                    
                    if error == nil {
                        
                        //make an entry in database
                        Database.database().reference().child("users").child(user!.uid).child("email").setValue(self.email.text!)
                        
                        //perform a segueway to success
                        self.performSegue(withIdentifier: "successSegue", sender: nil)
                    
                    
                    }
                    
                    
                })
                
                
                
                
            }
        }
        
        
    }


}

