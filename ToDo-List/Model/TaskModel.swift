//
//  TaskModel.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 21/06/25.
//

import Foundation
/// A model representing a single task in the ToDo list.
struct Task {
    let id : String
    let category : Category
    let caption : String
    let constantDate : Date
    var isCompleted : Bool
}
