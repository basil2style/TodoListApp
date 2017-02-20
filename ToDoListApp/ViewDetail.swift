//
//  ViewDetail.swift
//  ToDoListApp
//
//  Created by Basil on 2017-02-20.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit
import RealmSwift

class ViewDetail: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBAction func actionSave(_ sender: Any) {
        saveDetails()
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet weak var notes: UITextField!
    
    func saveDetails()  {
        let task = Task()
        task.name = nameLabel.text!
        task.completed = false
        task.notes = notes.text!
        print(type(of: task))
        do {
            let realm = try Realm()
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
