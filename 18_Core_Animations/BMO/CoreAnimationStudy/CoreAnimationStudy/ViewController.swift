//
//  ViewController.swift
//  CoreAnimationStudy
//
//  Created by BMO on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var juiceView: CustomView!
    private lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(fillAnimation))
    private var isTapped = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func fillAnimation() {
        let fillAnimation = CABasicAnimation(keyPath: "path")
        let melonSoda = juiceView.melonSodaLiquidLayer
        let maskingLayer = juiceView.maskingLayer
        let drinkHeight = 30
        let newRect = CGRect(x: 90, y: 200 + (120 - drinkHeight), width: 160, height: drinkHeight)
        
        if isTapped {
            isTapped = false
            fillAnimation.fromValue = melonSoda.path
            fillAnimation.toValue = UIBezierPath(rect: newRect).cgPath

        } else {
            isTapped = true
            fillAnimation.fromValue = UIBezierPath(rect: newRect).cgPath
            fillAnimation.toValue = melonSoda.path
        }
        
        fillAnimation.fillMode = .forwards
        fillAnimation.isRemovedOnCompletion = false
        fillAnimation.duration = 1
        
        melonSoda.add(fillAnimation, forKey: "path")
    }
    
}
