//
//  Typography.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 25/06/25.
//

import Foundation
import UIKit

extension UIFont {
    
    convenience init(type:FontType,size:FontSize) {
        self.init(name: type.name, size: size.value)!
    }
    static func style(_ style:FontStyle) -> UIFont{
        return style.font
    }
}
enum FontType : String {
    case assistantSemiBold = "Assistant-SemiBold"
    case assistantBold = "Assistant-Bold"
    case assistantMedium = "Assistant-Medium"
    case assistantExtraLight = "Assistant-ExtraLight"
    
}

extension FontType  {
    var name : String {
        return self.rawValue
    }
}

enum FontSize  {
    case custom(Double)
    case theme(FontStyle)
}

extension FontSize {
    var value : Double{
        switch self {
        case .custom(let customSize):
            return customSize
        case .theme(let size) :
            return size.size
        }
    }
}

enum FontStyle {
    case h1
    case secondaryText
    case caption
    case caption2
    case buttonTitle
}

extension FontStyle {
    var size :Double {
        switch self {
        case .h1:
            return 20.0
        case .secondaryText:
            return 17.0
        case .caption:
            return 15.0
        case .caption2:
            return 14.0
        case .buttonTitle:
            return 17
        }
    }
    
    
    var fontDescription : FontDescription {
        switch self {
        case .h1:
            return FontDescription(font: .assistantBold, size: .theme(.h1), style: .title1)
        case .secondaryText:
            return FontDescription(font: .assistantMedium, size: .theme(.secondaryText), style: .body)
        case .caption:
            return FontDescription(font: .assistantExtraLight, size: .theme(.caption), style: .caption1)
        case .caption2 :
            return FontDescription(font: .assistantExtraLight, size: .theme(.caption), style: .caption2)
        case .buttonTitle :
            return FontDescription(font: .assistantBold, size: .theme(.buttonTitle), style: .subheadline)
        }
        
    }
    
    var font : UIFont{
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size.value) else
        {
            return UIFont.preferredFont(forTextStyle: fontDescription.style)
        }
        let fontMetrices = UIFontMetrics(forTextStyle: fontDescription.style)
        return fontMetrices.scaledFont(for: font)
    }
}

struct FontDescription{
    var font:FontType
    var size:FontSize
    var style:UIFont.TextStyle
}
