//
//  File.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/12.
//

import Foundation

enum Priority: String, Codable { //codable is for encoding and decoding swift to json or json to swift, similar to @Serialization
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}


struct Task: Identifiable, Codable { // its better to use Identifiable with UUID data type rather than Int data type
    let id: UUID
    var description: String
    var dueDate: Date
    var priority: Priority
    var reminderEnabled: Bool 
    
    init(id: UUID, description: String, dueDate: Date, priority: Priority, reminderEnabled: Bool) {
        self.id = id
        self.description = description
        self.dueDate = dueDate
        self.priority = priority
        self.reminderEnabled = reminderEnabled
    }
    
    
}
