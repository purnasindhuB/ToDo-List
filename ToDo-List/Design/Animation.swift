//
//  Extension + UIView.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 26/06/25.
//

import UIKit

extension UIView {

    // 1. Scale-Up Animation (Springy Pop)
    func scaleUpAnimation() {
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(
            withDuration: 0.35,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 5,
            options: [.curveEaseOut],
            animations: {
                self.transform = CGAffineTransform.identity
            },
            completion: nil
        )
    }

    // 2. Pulse Animation (Shrink and bounce back)
    func pulseAnimation() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 0.2
        pulseAnimation.toValue = 0.9
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        layer.add(pulseAnimation, forKey: "pulse")
    }

    // 3. Shake Animation (Left and Right)
    func shakeAnimation() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.1
        shakeAnimation.repeatCount = 2
        shakeAnimation.autoreverses = true

        let fromPoint = CGPoint(x: self.center.x - 5, y: self.center.y)
        let toPoint = CGPoint(x: self.center.x + 5, y: self.center.y)

        shakeAnimation.fromValue = NSValue(cgPoint: fromPoint)
        shakeAnimation.toValue = NSValue(cgPoint: toPoint)

        layer.add(shakeAnimation, forKey: "shake")
    }
}
