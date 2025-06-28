//
//  CategoryModel.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import Foundation
import UIKit
import RealmSwift

enum Category : String, CaseIterable, PersistableEnum {
    case work = "Work", study = "Study", excercise = "Excerise"
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
    
    
