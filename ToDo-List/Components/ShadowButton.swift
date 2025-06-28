//
//  ShadowButton.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 26/06/25.
//

import UIKit

/// A custom UIButton with rounded corners, configurable shadow, and background color.
/// Designed to be easily styled from Interface Builder using `@IBInspectable` properties.
@IBDesignable
class ShadowButton: UIButton {
    
    /// The corner radius of the button. Default is 5.
    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    /// The background color of the button. Configurable in Interface Builder.
    @IBInspectable
    var customBackgroundColor: UIColor = .link {
        didSet {
            backgroundColor = customBackgroundColor
        }
    }

    /// The shadow color for the button. Default is blue.
    @IBInspectable
    var shadowColor: UIColor = .blue {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    /// Prepares the view for rendering in Interface Builder (Storyboard/ XIB preview).
    /// appear correctly while designing in Xcode Interface Builder.
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

    /// Called when the button is added to a superview.
    /// Sets the shadow offset to give a lifted appearance.
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.shadowOffset = CGSize(width: 0, height: 6)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius // Make sure to use the variable instead of hardcoded 5
    }

    /// Applies styling including font, background, and shadow.
    private func setupView() {
        titleLabel?.font = UIFont.appFont(for: .button) // Use `.style(.buttonTitle)` if not renamed
        backgroundColor = customBackgroundColor
        layer.shadowColor = shadowColor.cgColor
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
    }
}
