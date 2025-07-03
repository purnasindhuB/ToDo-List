//
//  UIColor + extension.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 22/06/25.
//

import Foundation
import UIKit
/// Represents a task category in the ToDo list.
extension UIColor {
    static var workColor: UIColor {
        return UIColor(named: "work")!
    }
    static var workBackgroundColor: UIColor {
        return UIColor(named: "work")!.withAlphaComponent(0.2)
    }
    /// The primary color used for "Exercise" category tasks.
       static var excerciseColor: UIColor {
           return UIColor(named: "exercise")!
       }

       /// The background color used for "Exercise" category tasks with reduced opacity.
       static var excerciseBackgroundColor: UIColor {
           return UIColor(named: "exercise")!.withAlphaComponent(0.2)
       }


    static var studyColor: UIColor {
        return UIColor(named: "study")!
    }
    static var studyBackgroundColor: UIColor {
        return UIColor(named: "study")!.withAlphaComponent(0.2)
    }
    static var secondaryLinkColor: UIColor {
        return UIColor(named: "secondaryLink")!.withAlphaComponent(0.2)
    }
    
}
