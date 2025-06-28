//
//  TaskModel.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 21/06/25.
//
///Represnts Task
import Foundation
import RealmSwift
struct Task {
    let id : String
    let category : Category
    let caption : String
    let constantDate : Date
    var isCompleted : Bool
}

class LocalTask:Object{
    @Persisted(primaryKey: true) var _id: String
    @Persisted var caption = ""
    @Persisted var createdDate = Date()
    @Persisted var cetgory = Category.study // default value
    @Persisted var isCompleted = false // default value
     
}
