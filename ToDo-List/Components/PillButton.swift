//
//  PillButton.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 26/06/25.
//

import UIKit

/// A custom UIButton that appears pill-shaped by rounding the corners to half its height.
/// Commonly used for call-to-action or styled secondary buttons.
class PillButton: UIButton {

    /// Called when the button is loaded from a nib or storyboard.
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.appFont(for: .button) // Use `.style(.buttonTitle)` if old API
        backgroundColor = .link
    }

    /// Called whenever the layout of the button changes.
    /// Adjusts corner radius to create a pill shape.
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
