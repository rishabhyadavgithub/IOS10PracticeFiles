//
//  ViewController.swift
//  HubbyList
//
//  Created by rishabh.yadav on 5/24/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class TableVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var tasks : [Task] = []
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        grabData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        grabData()
        tableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
         let task = tasks[indexPath.row]
        
        if task.today{
            
        cell.textLabel?.text = "TODAY:-\(task.name!)"
            }   else{
            
            cell.textLabel?.text = "\(task.name!)"
        }
        
        return cell
    }
    
    func grabData(){
        
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest())
        } catch {
            print("failed  to load data")
        }

        
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        if editingStyle == .delete {
            
            let task = tasks[indexPath.row]
            context.delete(task)
            guest.saveContext()
            
            do {
              tasks = try context.fetch(Task.fetchRequest())
            } catch  {
                print("deleting failed")
            }
            tableView.reloadData()
        }
    }

   

}

 
