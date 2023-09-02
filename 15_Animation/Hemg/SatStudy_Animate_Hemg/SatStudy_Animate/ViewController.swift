//
//  ViewController.swift
//  SatStudy_Animate
//
//  Created by Hyun A Song on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func errorYagom(_ sender: UIButton) {
        firstAnimation()
    }
    
    @IBAction func macYagom(_ sender: UIButton) {
        secondAnimation()
    }
    
    @IBAction func customYagom(_ sender: UIButton) {
        turnImage()
    }
    
    @IBAction func back(_ sender: UIButton) {
        stopAnimation()
    }
    
    
    private func firstAnimation() {
        UIView.animateKeyframes(withDuration: 0.1, delay: 0, options: [.autoreverse, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
//                let centerX = self.imageView.center.x
//                let centerY = self.imageView.center.y
//                self.imageView.frame = CGRect(origin: CGPoint(x: centerX+5, y: nil), size: CGSize(width: 240, height: 240))
                self.imageView.center.x += 5
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.imageView.center.x -= 5
            }
        }
    }
    
    private func stopAnimation() {
        imageView.layer.removeAllAnimations()
        imageView.transform = CGAffineTransform(translationX: 0, y: 0)
    }
    
    private func secondAnimation() {
        UIView.animateKeyframes(withDuration: 0.2, delay: 0,options: [.autoreverse, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2) {
                self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.5)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/2, relativeDuration: 2/2) {
                self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.2)
            }
            
//            UIView.addKeyframe(withRelativeStartTime: 3/3, relativeDuration: 3/3) {
//                self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
//            }
        }
    }
    
    private func turnImage() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = Double.pi * 200
        animation.duration = 50
        imageView.layer.add(animation, forKey: "rotation")
    }
    
}

