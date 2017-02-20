//
//  Tasks.swift
//  ToDoListApp
//
//  Created by Basil on 2017-02-14.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import Foundation
import Realm

class Tasks: RLMObject {
 
    dynamic var name : String = "";
    var completed : Bool = false;
    dynamic var notes : String = "";
    
    
    
    
}
