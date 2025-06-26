//
//  Extension + UIView.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 26/06/25.
//

import Foundation
import UIKit
func scaletupAnimation() (
    UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithBanping: 0.7, initialspringVelocitys 5, αptions: [.curveEaseOut]
                   
                   self.transform = CGAffineTransform.identity
                   }
                   
                   fune pulseAnimation() {
                       
                       let pulseAnination CABasicAnimation(keyPaths "transform.scale")
                       
                       pulseAnimatixon.duration 0.2
                       
                       pulseAnimation.toValue - 0.9 pulseAnimation.autoreverses true
                       
                       layer.add(pulseAnimation, forKey: nil)
                       
                       fune shakeAnimation() <
                       
                       let shakeAnimation CABasicAnisation(keyPath: "position") shakeAnimation.duration 0.1
                       
                       shakeAnimation.repeatCount=2
                       
                       shakeAnimation.autoreverses true
                       
                       let fromPoint CGPoint(x: center.x-5, y: center.y)
                       
                       let toPoint = CGPoint(x: center.x + 5, y: center.y)
                       
                       shakeAnimation.fromValue fromPoint
                       
                       shakeAnimation.tovalue topoint
                       
                       layer.add(shakeAnimation, forkey: nil)
                       
                   }
