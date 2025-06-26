//
//  UIColor + extension.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 22/06/25.
//

import Foundation
import UIKit

extension UIColor {
    static var workColor: UIColor {
        return UIColor(named: "work")!
    }
    static var workBackgroundColor: UIColor {
        return UIColor(named: "work")!.withAlphaComponent(0.2)
    }
    static var excerciseColor: UIColor {
        return UIColor(named: "excercise")!
    }
    static var excerciseBackgroundColor: UIColor {
        return UIColor(named: "excercise")!.withAlphaComponent(0.2)
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
