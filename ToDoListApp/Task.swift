//
//  Task.swift
//  ToDoListApp
//
//  Created by Basil(300919992) on 2017-02-20.
//  Copyright © 2017 Centennial College. All rights reserved.
//  Model Class

import UIKit
import RealmSwift

//Model
class Task: Object {
    dynamic var name : String = "";
    dynamic var completed : Bool = false;
    dynamic var notes : String = "";
    dynamic var index : Int = 0;
    
   
}
