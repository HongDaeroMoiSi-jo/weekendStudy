//
//  ViewController.swift
//  SatStudy_Animate
//
//  Created by Hyun A Song on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var imageCenterConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpErrorButton(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 0.1, delay: 0, options: [.autoreverse, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.myImage.frame.origin.x -= 5
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.myImage.frame.origin.x += 10
            }
        }
    }
    
    @IBAction func touchUpNewButton(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.repeat, .calculationModeCubic], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/2.0) {
                    self.myImage.transform = CGAffineTransform(scaleX: 1, y: 1.5)
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/2.0) {
                    self.myImage.transform = CGAffineTransform(scaleX: 1.5, y: 1)
                }
                UIView.addKeyframe(withRelativeStartTime: 1.0/2.0, relativeDuration: 1) {
                    self.myImage.transform = CGAffineTransform(scaleX: 1.5, y: 1)
                }
                UIView.addKeyframe(withRelativeStartTime: 1.0/2.0, relativeDuration: 1) {
                    self.myImage.transform = CGAffineTransform(scaleX: 1, y: 1.5)
                }
            })
    }
    
    @IBAction func touchUpCustomButton(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.myImage.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi / 2))
                self.myImage.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.myImage.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
                self.myImage.alpha = 0.5
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.myImage.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi * 3 / 2))
                self.myImage.alpha = 0.75
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.myImage.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.myImage.alpha = 1
            }
        }
    }
    
    @IBAction func touchUpReturn(_ sender: UIButton) {
        myImage.layer.removeAllAnimations()
    }
}
