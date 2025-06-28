//
//  RoundedButton.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 26/06/25.
//

import UIKit

/// A reusable button with rounded corners and predefined font styling.
/// The corner radius is fixed at 5 points, giving it a soft, modern appearance.
class RoundedButton: UIButton {

    /// Called when the button is loaded from a storyboard or nib.
    /// Sets up font and background styling.
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.appFont(for: .button) // Or `.style(.buttonTitle)` if you're using old style method
        backgroundColor = .link
    }

    /// Called when the button's layout is updated.
    /// Applies the rounded corner styling.
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}
