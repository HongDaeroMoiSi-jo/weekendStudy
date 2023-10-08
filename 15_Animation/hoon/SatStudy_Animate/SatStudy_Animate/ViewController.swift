//
//  ViewController.swift
//  SatStudy_Animate
//
//  Created by Hyun A Song on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var serenaImageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func error(_ sender: UIButton) {
        print("error")
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.curveLinear]) {
                self.serenaImageVIew.frame.origin.x -= 10
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self.serenaImageVIew.frame.origin.x += 10
                }
            }
    }
    
    @IBAction func new(_ sender: UIButton) {
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: .repeat) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                    self.serenaImageVIew.transform = CGAffineTransform(scaleX: 0.8, y: 1.6)
                }
                UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 2/4) {
                    self.serenaImageVIew.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
                UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 3/4) {
                    self.serenaImageVIew.transform = CGAffineTransform(scaleX: 1.6, y: 0.8)
                }
                UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1) {
                    self.serenaImageVIew.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        print("reset")
//        view.subviews.forEach({$0.layer.removeAllAnimations()})
        serenaImageVIew.layer.removeAllAnimations()
//        view.layoutIfNeeded()
    }
    
}

