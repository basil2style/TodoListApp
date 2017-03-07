//
//  ViewDetail.swift
//  ToDoListApp
//
//  Created by Basil(300919992) on 2017-02-20.
//  Copyright © 2017 Centennial College. All rights reserved.
//  This is the details screen

import UIKit
import RealmSwift


class ViewDetail: UIViewController {
    
    
    var datasource : Results<Task>! = nil
    let task = Task()
    var nameReceived : String!
    var notesReceived : String!
    var index: Int!
    var taskValue: TaskItemProtocol?
    var taskItem: Task?
    var forUpdate : Bool!
    @IBOutlet weak var nameLabel: UITextField!
    @IBAction func actionSave(_ sender: Any) {
        saveDetails()
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     //   print(nameReceived)
 
        if taskItem == nil {
            self.title = "Add Item"
        }else {
            self.title = "Update Item"
            nameLabel.text = taskItem?.name
            notes.text = taskItem?.notes
        }
    }
    @IBOutlet weak var notes: UITextField!
    
    //saving details
    func saveDetails()  {
        let task = Task()
        task.name = nameLabel.text!
        task.completed = false
        task.notes = notes.text!
        print(type(of: task))
        do {
            let realm = try Realm()
            //realm write features
            try realm.write {
                Void in
                realm.add(task)
                print("Saved successfully")
                
            }
        }
        catch {
            
        }
           }
}

protocol TaskItemProtocol {
    func addTask(_ taskItem: Task)
    func updateTask(at: Int, with: Task)
}












