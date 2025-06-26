//
//  ShadowButton.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 26/06/25.
//

import UIKit
@IBDesignable
class ShadowButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var background: UIColor = .link{
        didSet{
            backgroundColor = background
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = .red{
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    override  func prepareForInterfaceBuilder() {
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = UIColor.yellow
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.shadowOffset = CGSize(width: 0, height: 6)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowColor = UIColor(named: "secondaryLink")?.cgColor
    }
}
