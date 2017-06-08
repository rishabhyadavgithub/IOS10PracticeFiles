//
//  ViewController.swift
//  CustomCells
//
//  Created by rishabh.yadav on 5/25/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    var names = ["surprizey","whity","meany","hidy","yellowy","kidy"]
    
    var images = [UIImage(named : "surprizey"),
                  UIImage(named : "whity"),
                  UIImage(named : "meany"),
                  UIImage(named : "hidy"),
                  UIImage(named : "yellowy"),
                  UIImage(named : "kidy")]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as! CustomCell
 
        
        cell.photo.image = images[indexPath.row]
        cell.label.text = names[indexPath.row]
        
        
        return cell
    }
    
    
    
    
    
    
    

}

