//
//  ViewController.swift
//  First experience with Core Animation
//
//  Created by 123 on 15.11.23.
//

import UIKit
import TheAnimation

class ViewController: UIViewController {
    
    let layer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 250, height: 250)
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.rotate()
        }
    }
    
    
    func animateMovement() {
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2)
                                      , y: layer.frame.origin.y + (layer.frame.size.height/2))
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration  = 1
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }
    
    func animateOpacity() {
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration  = 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }
    
    func rotate() {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi * 12
        animation.duration  = 1
        animation.timingFunction = .linear
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }

}

