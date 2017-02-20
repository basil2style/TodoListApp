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
        let realm = try! Realm()
        datasource = realm.objects(Task)
        tableView.reloadData()
    }

    
    @IBAction func newTask(_ sender: Any) {
        performSegue(withIdentifier: "detailScreen", sender: nil)
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
    
    
    

}

