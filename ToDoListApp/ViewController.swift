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

    var datasource : Results<Task>!
    var valueToPass:String!
    let realm = try! Realm()

    
    @IBOutlet weak var tableView: UITableView!
    //var task = Task.allObjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        reloadTable()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTable()
    }
    
    func reloadTable()  {
               datasource = realm.objects(Task)
               tableView.reloadData()
    }

    
    @IBAction func newTask(_ sender: Any) {
        performSegue(withIdentifier: "detailScreen", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(datasource.count) // [3]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        
        let index = UInt(indexPath.row)
        let currentDetail = datasource[indexPath.row]
        cell.textLabel?.text = currentDetail.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  let currentNote = datasource[indexPath,0]
        
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        //print(currentCell)
        valueToPass = currentCell.textLabel?.text
        // Segue to the second view controller
        //print(datasource.)
        self.performSegue(withIdentifier: "details", sender: self)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Done") {
            (deleteAction, indexPath) -> Void in
            
             let listToBeDeleted = self.datasource[indexPath.row]
            print(indexPath.row)
            try! self.realm.write {
                () -> Void in
                self.realm.delete(listToBeDeleted)
                self.reloadTable()
            }
            
            }
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Edit") {
            (editAction, indexPath) -> Void in
            
        }
        return [deleteAction,editAction]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondVC = segue.destination as! ViewDetail
       // print(valueToPass)
        if (segue.identifier == "details") {
            secondVC.nameReceived = valueToPass
            secondVC.forUpdate = true
            
        }
        
        //secondVC.notesReceived =
        if (segue.identifier == "detailScreen") {
            //secondVC.nameReceived = valueToPass
            secondVC.forUpdate = false
            
        }
    }
}

