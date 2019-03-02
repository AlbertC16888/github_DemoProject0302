//
//  ViewController.swift
//  Demo0302-3
//
//  Created by 周子文 on 2019/3/2.
//  Copyright © 2019 Albert Chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var demoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoView = UIView()
        demoView.backgroundColor = UIColor.red
        demoView.translatesAutoresizingMaskIntoConstraints = false
        //uhgrehlighih
        
        view.addSubview(demoView)
        demoView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        demoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        demoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        demoView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.startAnimation()
        }
        
    }
    func startAnimation() {
//        let  basicAnimation = CABasicAnimation(keyPath: "position")
//        basicAnimation.fromValue = CGPoint(x: 20, y: 20)
//        basicAnimation.toValue = CGPoint(x: 150, y: 150)
//        basicAnimation.isRemovedOnCompletion = false
//        basicAnimation.fillMode = .forwards
//        basicAnimation.repeatCount = 5
//        basicAnimation.autoreverses = true
//        basicAnimation.speed = 2
//        basicAnimation.duration = 5
//        demoView.layer.add(basicAnimation, forKey: nil)
        
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "position.x")
        keyframeAnimation.values = [-100, 10, 250, 0]
        keyframeAnimation.keyTimes = [0, 0.1, 0.2, 0.9, 1.0]
        keyframeAnimation.duration = 10
        keyframeAnimation.isRemovedOnCompletion = false
        keyframeAnimation.fillMode = .forwards
        keyframeAnimation.rotationMode = CAAnimationRotationMode.rotateAuto
        keyframeAnimation.calculationMode = .paced
        
        let demoPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200))
        keyframeAnimation.path = demoPath.cgPath
        
        demoView.layer.add(keyframeAnimation, forKey: nil)
        
        
    }


}

