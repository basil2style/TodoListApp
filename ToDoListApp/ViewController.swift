//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Basil on 2017-01-31. (300919992)
//  Copyright © 2017 Centennial College. All rights reserved.
//  This is a TodoList application 

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var task = Tasks.allObjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData() // [2]
    }

    
    @IBAction func newTask(_ sender: Any) {
      /*  let alert = UIAlertController(title: "New item", message: "Add a new item", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default)
        {   (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            let realm = try! Realm()
            if (textField.text?.characters.count)! > 0 {
                let newTask = Tasks()
                newTask.task = textField.text!
                
                try! realm.write {
                  //  realm.add(self)
                  //  realm.create(Tasks.self, value: ["task":newTask.task])
                }
                
                
                
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(saveAction)
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
 */
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(task.count) // [3]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        
        let index = UInt(indexPath.row)
        let todoItem = task.object(at: index) as! Tasks // [4]
        cell.textLabel!.text = todoItem.name // [5]
        
        return cell
    }
    
    

}

