//
//  ViewController.swift
//  SatStudy_Animate
//
//  Created by BMO on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yagomImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yagomImageView.image = UIImage(named: "yagom")
    }

    @IBAction func tapErrorOccurredYagomButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.075, delay: 0, options: .repeat, animations: {
            self.yagomImageView.frame.origin.x -= 10
        })
    }
    
    @IBAction func tapBuyNewMacBookYagom(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.repeat, .calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/2.0) {
                self.yagomImageView.transform = CGAffineTransform(scaleX: 1, y: 1.5)
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/2.0) {
                self.yagomImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1)
            }
            UIView.addKeyframe(withRelativeStartTime: 1.0/2.0, relativeDuration: 1) {
                self.yagomImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1)
            }
            UIView.addKeyframe(withRelativeStartTime: 1.0/2.0, relativeDuration: 1) {
                self.yagomImageView.transform = CGAffineTransform(scaleX: 1, y: 1.5)
            }
        })
    }
    
    @IBAction func tapCustomButton(_ sender: UIButton) {
    }
    
    @IBAction func tapResetButton(_ sender: UIButton) {
        yagomImageView.layer.removeAllAnimations()
        self.yagomImageView.transform = CGAffineTransform(translationX: 0, y: 0)
    }
}

