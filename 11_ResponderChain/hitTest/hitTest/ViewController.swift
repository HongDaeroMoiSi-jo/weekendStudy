//
//  ViewController.swift
//  hitTest
//
//  Created by 1 on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: ColorView!
    @IBOutlet weak var orangeView: ColorView!
    @IBOutlet weak var purpleView: ColorView!
    @IBOutlet weak var blueView: ColorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1
//        let greenViewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        greenView.addGestureRecognizer(greenViewTap)
//
//        let orangeViewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        orangeView.addGestureRecognizer(orangeViewTap)
//
//        let purpleViewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        purpleView.addGestureRecognizer(purpleViewTap)
//
//        let blueViewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        blueView.addGestureRecognizer(blueViewTap)
      
        // 2
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        greenView.addGestureRecognizer(gesture)
    }
    
    //1
//    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
//        if let tappedView = gesture.view {
//            print(tappedView.backgroundColor!)
//        }
//    }
    
     // 2
    @objc func tapped(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view else { return }
        if view.backgroundColor == .green {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .green
        }
    }
    @IBAction func tapAction(_ sender: UIButton) {
        print("세레나 좋은 접근성 좋은 생각 아주 좋아!")
    }
}

class ColorView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
//                print(subview.backgroundColor!)
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
//                print(subview.backgroundColor!)
            }
            return self
        }
        return nil
    }
}


/*
 오렌지 눌렀을때 루트뷰인 흰색뷰 -> 그린뷰 -> 오렌지 여기까지오면 더이상 서브뷰가없으니 힛테스트가안된다. 리턴 실행
 
 */
