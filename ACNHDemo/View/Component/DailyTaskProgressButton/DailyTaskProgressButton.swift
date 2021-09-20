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
            progressAnimation()
        }
    }
    private var previousValue: Double = 0
    
    @IBInspectable var iconTask: UIImage? = nil {
        didSet {
            setIcon(icon: iconTask)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        createCircularPath()
    }
    
    private func createCircularPath() {
        let lineWidth = CGFloat(4.0)
        let radius = min(frame.size.width, frame.size.height) / 2 - lineWidth / 2 - padding
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: radius, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = lineWidth
        circleLayer.strokeColor = ACNHColor.dailyProgressBackground?.cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.green.cgColor
        
        layer.addSublayer(progressLayer)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(progressPlus))
        self.addGestureRecognizer(tap)
        
    }
    
    private func progressAnimation() {
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
            previousValue = currentValue
            currentValue += 1
            progressAnimation()
        }
    }
    
    func setIcon(icon: UIImage?) {
        let sideLength = min(frame.size.width, frame.size.height) * 0.66
        let imageX = frame.size.width / 2.0 - sideLength / 2.0
        let imageY = frame.size.height / 2.0 - sideLength / 2.0
        
        let imageLayer = CALayer()
        imageLayer.frame = CGRect.init(x: imageX, y: imageY, width: sideLength, height: sideLength)
        imageLayer.contents = icon?.cgImage
        imageLayer.backgroundColor = ACNHColor.dailyIconBackground?.cgColor
        
        let radius = min(frame.size.width, frame.size.height) / 2 - padding
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: radius * 2 - padding / 2, height: radius * 2 - padding / 2), cornerRadius: radius).cgPath
        
        imageLayer.mask = maskLayer
        layer.addSublayer(imageLayer)
    }

}