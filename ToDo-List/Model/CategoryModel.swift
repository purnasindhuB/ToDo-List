//
//  CategoryModel.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import Foundation
import UIKit

/// Represents a task category in the ToDo list.
enum Category : String, CaseIterable {
    case work = "Work", study = "Study", excercise = "Excerise"
    
    /// Returns the primary color associated with the category.
    var color : UIColor {
        switch self {
        case .work:
            return UIColor.workColor
        case .study:
            return UIColor.studyColor
        case .excercise:
            return UIColor.excerciseColor
        }
    }
    
    /// Returns a lighter background color variant for the category.
    var backgroundColor : UIColor {
        switch self {
        case .work:
            return UIColor.workBackgroundColor
        case .study:
            return UIColor.studyBackgroundColor
        case .excercise:
            return UIColor.excerciseBackgroundColor
        }
    }
}
    
    
