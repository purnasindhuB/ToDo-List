//
//  UIFont+Styles.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 25/06/25.
//

import Foundation
import UIKit

/// Extension to `UIFont` that allows custom typography using predefined styles.
extension UIFont {
    
    /// Initializes a custom font using a font weight and size.
    /// - Parameters:
    ///   - weight: The custom font weight.
    ///   - size: The custom size.
    convenience init(weight: AppFontWeight, size: AppFontSize) {
        self.init(name: weight.name, size: size.pointSize)!
    }
    
    /// Returns a scaled `UIFont` for a given `AppFontStyle`.
    /// - Parameter style: The style to be applied.
    /// - Returns: A scaled font suitable for dynamic type.
    static func appFont(for style: AppFontStyle) -> UIFont {
        return style.font
    }
}

/// Represents available custom font weights mapped to actual font names.
enum AppFontWeight: String {
    case semiBold = "Assistant-SemiBold"
    case bold = "Assistant-Bold"
    case medium = "Assistant-Medium"
    case extraLight = "Assistant-ExtraLight"
}

extension AppFontWeight {
    /// The raw font name used in `UIFont(name:size:)`.
    var name: String {
        return rawValue
    }
}

/// Describes how font sizes are defined.
enum AppFontSize {
    /// A custom size defined directly in points.
    case custom(Double)
    /// A size derived from a predefined `AppFontStyle`.
    case style(AppFontStyle)
}

extension AppFontSize {
    /// The resolved point size for the font.
    var pointSize: Double {
        switch self {
        case .custom(let size):
            return size
        case .style(let style):
            return style.size
        }
    }
}

/// Predefined text styles used across the app’s UI.
enum AppFontStyle {
    case title
    case body
    case caption
    case label
    case button
}

extension AppFontStyle {
    
    /// Raw font size in points.
    var size: Double {
        switch self {
        case .title: return 20.0
        case .body: return 17.0
        case .caption: return 15.0
        case .label: return 14.0
        case .button: return 17.0
        }
    }
    
    /// Provides font metadata including weight, size, and system text style.
    var description: AppFontDescription {
        switch self {
        case .title:
            return AppFontDescription(font: .bold, size: .style(.title), style: .title1)
        case .body:
            return AppFontDescription(font: .medium, size: .style(.body), style: .body)
        case .caption:
            return AppFontDescription(font: .extraLight, size: .style(.caption), style: .caption1)
        case .label:
            return AppFontDescription(font: .extraLight, size: .style(.label), style: .caption2)
        case .button:
            return AppFontDescription(font: .bold, size: .style(.button), style: .subheadline)
        }
    }
    
    /// A scaled `UIFont` based on the current style.
    var font: UIFont {
        guard let baseFont = UIFont(name: description.font.name, size: description.size.pointSize) else {
            return UIFont.preferredFont(forTextStyle: description.style)
        }
        return UIFontMetrics(forTextStyle: description.style).scaledFont(for: baseFont)
    }
}

/// Contains all the properties required to describe a font.
struct AppFontDescription {
    /// The custom font weight.
    var font: AppFontWeight
    /// The size (fixed or style-based).
    var size: AppFontSize
    /// The text style used for scaling (e.g., `.body`, `.caption1`).
    var style: UIFont.TextStyle
}
