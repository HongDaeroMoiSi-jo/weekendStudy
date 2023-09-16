//
//  CustomView.swift
//  CoreAnimationStudy
//
//  Created by BMO on 2023/09/16.
//

import UIKit

class CustomView: UIView {
    let cupLayer = CAShapeLayer()
    let strawLayer = CAShapeLayer()
    let melonSodaLiquidLayer = CAShapeLayer()
    let maskingLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawStraw()
        drawMelonSodaLiquid()
        drawCup()
        drawMasking()
        applyMasking()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        drawStraw()
        drawMelonSodaLiquid()
        drawCup()
        drawMasking()
        applyMasking()
    }
    
    func drawCup() {
        let cupPath = UIBezierPath()
        
        cupPath.move(to: CGPoint(x: 100, y: 100))
        cupPath.addLine(to: CGPoint(x: 120, y: 300))
        cupPath.addQuadCurve(to: CGPoint(x: 220, y: 300), controlPoint: CGPoint(x: 170, y: 300 + 30))
        cupPath.addLine(to: CGPoint(x: 240, y: 100))
        
        cupLayer.path = cupPath.cgPath
        cupLayer.strokeColor = UIColor.gray.cgColor
        cupLayer.lineWidth = 5
        cupLayer.fillColor = .none
        
        self.layer.addSublayer(cupLayer)
    }
    
    func drawStraw() {
        let strawPath = UIBezierPath()
        
        strawPath.move(to: CGPoint(x: 140, y: 290))
        strawPath.addLine(to: CGPoint(x: 230, y: 95))
        strawPath.addLine(to: CGPoint(x: 270, y: 60))
        
        strawLayer.path = strawPath.cgPath
        strawLayer.strokeColor = UIColor.darkGray.cgColor
        strawLayer.lineWidth = 5
        strawLayer.fillColor = .none
        strawLayer.lineCap = .round
        
        self.layer.addSublayer(strawLayer)
    }
    
    func drawMelonSodaLiquid() {
        let melonSodaLiquidPath = UIBezierPath(rect: CGRect(x: 90, y: 200, width: 160, height: 120))
        
        melonSodaLiquidLayer.path = melonSodaLiquidPath.cgPath
        melonSodaLiquidLayer.strokeColor = .none
        melonSodaLiquidLayer.fillColor = UIColor.green.cgColor
        
        self.layer.addSublayer(melonSodaLiquidLayer)
    }
    
    func drawMasking() {
        let maskingPath = UIBezierPath()
        
        maskingPath.move(to: CGPoint(x: 100, y: 100))
        maskingPath.addLine(to: CGPoint(x: 120, y: 300))
        maskingPath.addQuadCurve(to: CGPoint(x: 220, y: 300), controlPoint: CGPoint(x: 170, y: 300 + 30))
        maskingPath.addLine(to: CGPoint(x: 240, y: 100))
        maskingPath.close()
        
        maskingLayer.path = maskingPath.cgPath
    }
    
    func applyMasking() {
        melonSodaLiquidLayer.mask = maskingLayer
    }
}
