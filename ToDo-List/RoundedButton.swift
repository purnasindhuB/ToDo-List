//
//  RoundedButton.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 26/06/25.
//

import UIKit

class RoundedButton: UIButton {
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = UIColor.link
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        
    }
}
