//
//  SignInVC.swift
//  
//
//  Created by rishabh.yadav on 5/31/17.
//
//

import UIKit
import Firebase


class SignInVC: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    @IBAction func signInUpTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil {
                
               Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!, completion: { (user, error) in
               
                if error != nil {
                    self.errorMessage.text = error?.localizedDescription
                }else
                    {
                    self.errorMessage.text = "creating user was a success"
                    
                
                    Database.database().reference().child("agents").child(user!.uid).child("email").setValue(user?.email)
                    
                    self.performSegue(withIdentifier: "HomeViewSegue", sender: nil)
                    
                    
                }
                
                
               })
            }else{
                self.errorMessage.text = "Sign in success"
                self.performSegue(withIdentifier: "HomeViewSegue", sender: nil)
            }
        }
        
        
        
        
    }
    

   
}
