//
//  ViewController.swift
//  TableDemo
//
//  Created by rishabh.yadav on 5/24/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class TableVC: UIViewController , UITableViewDataSource, UITableViewDelegate {

    var avengers = ["thor","ironman","hulk","capt. america","black widow"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
            }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avengers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        
        cell.textLabel?.text = avengers[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: avengers[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var guest = segue.destination as! DetailVC
        
        guest.hero = sender as! String
    }
    
    //code for deleting a row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            avengers.remove(at: indexPath.row)
            tableView.deleteRows(at:  [indexPath], with: .fade)
        }
    }
    
    
    
    
    

}


