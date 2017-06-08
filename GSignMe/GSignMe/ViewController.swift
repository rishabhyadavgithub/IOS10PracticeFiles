//
//  ViewController.swift
//  GSignMe
//
//  Created by rishabh.yadav on 5/28/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController ,GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

