//
//  TaskEntity+CoreDataProperties.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/14.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var reminderEnabled: Bool
    @NSManaged public var taskPriority: String?
    @NSManaged public var taskDate: Date?
    @NSManaged public var taskDescription: String?
    @NSManaged public var id: UUID?
    @NSManaged public var taskCompleted: Bool

}

extension TaskEntity : Identifiable {

}
