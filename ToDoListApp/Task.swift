//
//  Task.swift
//  ToDoListApp
//
//  Created by Basil on 2017-02-20.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit
import RealmSwift

//Model
internal class Task: Object {
    dynamic var name : String = "";
    var completed : Bool = false;
    dynamic var notes : String = "";
    
    
    
    
}
