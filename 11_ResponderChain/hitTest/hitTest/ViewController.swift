//
//  ViewController.swift
//  hitTest
//
//  Created by 1 on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
        let greenViewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        greenView.addGestureRecognizer(greenViewTap)
        
        let orangeViewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        orangeView.addGestureRecognizer(orangeViewTap)
        
        
        //2
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        orangeView.addGestureRecognizer(gesture)
    }
    
    //1
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        if let tappedView = gesture.view {
            print(tappedView.backgroundColor!)
        }
    }
    
    //2
    @objc func tapped(_ gesture: UITapGestureRecognizer) {
        guard let view = orangeView.next as? UIView else { return }
        if view.backgroundColor == .green {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .green
        }
    }
}

class ColorView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
            
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
            return self
        }
        return nil
    }
 
}
