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
    let createdDate : Date
    var isComplete : Bool
}

class LocalTask:Object{
    @Persisted(primaryKey: true) var _id: String
    @Persisted var caption = ""
    @Persisted var createdDate = Date()
    @Persisted var category = Category.study // default value
    @Persisted var isComplete = false // default value
     
}
