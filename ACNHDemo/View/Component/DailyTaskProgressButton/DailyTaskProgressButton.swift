//
//  DailyTaskProgressButton.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/9.
//

import UIKit

@IBDesignable
class DailyTaskProgressButton: UIView {
    
    private let circleLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let startPoint = CGFloat(-Double.pi / 2)
    private let endPoint = CGFloat(3 * Double.pi / 2)
    private let padding: CGFloat = 10
    @IBInspectable var maxValue: Double = 3
    @IBInspectable var currentValue: Double = 0 {
        didSet {
            progressAnimation(previousValue: 0)
        }
    }
    private lazy var centerX = frame.size.width / 2.0
    private lazy var centerY = frame.size.height / 2.0
    
    @IBInspectable var iconTask: UIImage? {
        didSet {
            createBackground() // Draw background frist
            setIcon(icon: iconTask)
        }
    }
    
    var onProgressPlus:((_ currentValue: Double) -> Void)?
    private let lineWidth = CGFloat(4.0)
    private lazy var radius = min(frame.size.width, frame.size.height) / 2 - lineWidth / 2 - padding

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        createCircularPath()
    }
    
    private func createCircularPath() {
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: centerX, y: centerY),
            radius: radius,
            startAngle: startPoint,
            endAngle: endPoint,
            clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = lineWidth
        circleLayer.strokeColor = R.color.dailyProgressBackground()?.cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.systemGreen.cgColor
        
        layer.addSublayer(progressLayer)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(progressPlus))
        self.addGestureRecognizer(tap)
    }
    
    private func createBackground() {
        let backgroundLayer = CALayer()
        let backgroundX = centerX - radius
        let backgroundY = centerY - radius
        backgroundLayer.frame = CGRect.init(x: backgroundX, y: backgroundY, width: radius * 2, height: radius * 2)
        backgroundLayer.backgroundColor = R.color.dailyIconBackground()?.cgColor
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2), cornerRadius: radius).cgPath
        backgroundLayer.mask = maskLayer
        
        layer.addSublayer(backgroundLayer)
    }
    
    private func progressAnimation(previousValue: Double) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1
        animation.fromValue = Float(previousValue / maxValue)
        animation.toValue = Float(currentValue / maxValue)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnim")
    }
    
    func setMaxValue(maxValue: Double) {
        self.maxValue = maxValue
    }
    
    @objc func progressPlus() {
        if currentValue < maxValue {
            let previousValue = currentValue
            currentValue += 1
            progressAnimation(previousValue: previousValue)
        }
        onProgressPlus?(currentValue)
    }
    
    private func setIcon(icon: UIImage?) {
        let imageLayerSideLength = min(frame.size.width, frame.size.height) * 0.5
        let imageX = centerX - imageLayerSideLength / 2.0
        let imageY = centerY - imageLayerSideLength / 2.0
        
        let imageLayer = CALayer()
        imageLayer.frame = CGRect.init(x: imageX, y: imageY, width: imageLayerSideLength, height: imageLayerSideLength)
        imageLayer.contents = icon?.cgImage
        
        layer.addSublayer(imageLayer)
    }

}
