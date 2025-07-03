//
//  TaskModel+CoreDataProperties.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 01/07/25.
//
//

import Foundation
import CoreData


extension TaskModel {

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
