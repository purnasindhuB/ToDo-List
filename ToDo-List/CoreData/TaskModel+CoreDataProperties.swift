//
//  TaskModel+CoreDataProperties.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 01/07/25.
//
//

import Foundation
import CoreData

/// Extension to define Core Data properties and fetch request for TaskModel
extension TaskModel {
    // Generates a fetch request to retrieve TaskModel entities
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskModel> {
        return NSFetchRequest<TaskModel>(entityName: "TaskModel")
    }

    @NSManaged public var category: String
    @NSManaged public var caption: String
    @NSManaged public var createdDate: Date
    @NSManaged public var isComplete: Bool

}

extension TaskModel : Identifiable {

}
