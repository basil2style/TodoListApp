//
//  ViewDetail.swift
//  ToDoListApp
//
//  Created by Basil on 2017-02-20.
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
    
    var forUpdate : Bool!
    @IBOutlet weak var nameLabel: UITextField!
    @IBAction func actionSave(_ sender: Any) {
        if !forUpdate{
        saveDetails()
        }
        else {
            //If it for update feature.
            let realm = try! Realm()
            let task = realm.objects(Task.self)
            print(task.description)
           // task.index(matching: nameReceived)
            try! realm.write {
             
             //   task.setValue(nameLabel.text, forKeyPath: "name")
                // set each person's planet property to "Earth"
               // task.setValue(notes.text!, forKeyPath: "notes")
                
            }
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     //   print(nameReceived)
        if forUpdate == true {
            let realm = try! Realm()
            //finding notes using name
            datasource = try realm.objects(Task.self).filter("name = %@",nameReceived)
            print(datasource.value(forKey: "notes")! )
            let value = datasource.value(forKey: "notes")!
            let myString: String = String(describing: value)
            var myStringArr = myString.components(separatedBy: "(\n")
            var extractString =  myStringArr[1].components(separatedBy: "\n)")
            print(extractString[0])
            //notes.text = myStringArr[0]
            notes.text = extractString[0]
            nameLabel.text = nameReceived
            //Results<Task> ults = realm.where(Task.class).equalsTo("name",nameReceived).findAll
        }
        //  print(datasource.description)s
        
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
                realm.add(task,update:true)
                print("Saved successfully")
                
            }
        }
        catch {
            
        }
        
    }
}
