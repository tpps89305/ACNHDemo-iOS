//
//  TimeScaleView.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/5.
//
//

import UIKit

@IBDesignable
class TimeScaleView: UIView {
    
    var mTime: Time?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutIfNeeded() {
        print("layoutIfNeeded")
    }
    
    override func layoutSubviews() {
        print("layoutSubviews: \(frame)")
        
        let padding: CGFloat = 10
        let drawOriginX = padding
        let drawOriginY = frame.height - 10
        let drawTargetLength = frame.width - padding * 2
        
        switch mTime {
        case .empty:
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 0, endHour: 24))
            break
        case .the4Am9Pm:
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 4, endHour: 21))
            break
        case .the4Pm9Am:
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 16, endHour: 24))
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 0, endHour: 9))
            break
        case .the9Am4Pm:
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 9, endHour: 16))
            break
        case .the9Am4Pm9Pm4Am:
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 9, endHour: 16))
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 21, endHour: 24))
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 0, endHour: 4))
        case .the9Pm4Am:
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 21, endHour: 24))
            layer.addSublayer(drawValueLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength, startHour: 0, endHour: 4))
            break
        case .none:
            break
        }

        layer.addSublayer(drawBottomLine(originX: drawOriginX - 1, originY: drawOriginY, targetLength: drawTargetLength + 2))
        layer.addSublayer(drawScaleLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength))
        layer.addSublayer(drawScaleLine2(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength))
        layer.addSublayer(drawScaleLine3(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength))
        drawText(parent: self, originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength)
    }
    
    func drawTimeScale(time: Time) {
        mTime = time
        print("drawTimeScale: \(frame)")
    }

    private func drawBottomLine(originX: CGFloat, originY: CGFloat, targetLength: CGFloat) -> CAShapeLayer {
        let bottomLine = UIBezierPath()
        bottomLine.move(to: CGPoint(x: originX, y: originY))
        bottomLine.addLine(to: CGPoint(x: originX + targetLength, y: originY))
        bottomLine.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.path = bottomLine.cgPath
        return shapeLayer
    }

    private func drawScaleLine(originX: CGFloat, originY: CGFloat, targetLength: CGFloat) -> CAShapeLayer {
        let scaleDistance = CGFloat(targetLength) / 4.0
        var newX = originX

        let scalePath = UIBezierPath()
        for _ in 1...5 {
            scalePath.move(to: CGPoint(x: newX, y: originY))
            scalePath.addLine(to: CGPoint(x: newX, y: originY - 20))
            scalePath.close()
            newX = newX + scaleDistance
        }

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.path = scalePath.cgPath
        return shapeLayer
    }

    private func drawScaleLine2(originX: CGFloat, originY: CGFloat, targetLength: CGFloat) -> CAShapeLayer {
        let scaleDistance = CGFloat(targetLength) / 4.0
        var newX = originX
        newX = newX + scaleDistance / 2

        let scalePath = UIBezierPath()
        for _ in 1...4 {
            scalePath.move(to: CGPoint(x: newX, y: originY - 3))
            scalePath.addLine(to: CGPoint(x: newX, y: originY - 17))
            scalePath.close()
            newX = newX + scaleDistance
        }

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = scalePath.cgPath
        return shapeLayer
    }

    private func drawScaleLine3(originX: CGFloat, originY: CGFloat, targetLength: CGFloat) -> CAShapeLayer {

        let scaleDistance = CGFloat(targetLength) / 24.0
        var newX = originX

        let scalePath = UIBezierPath()
        for index in 0...23 {
            if (index % 3 == 0) {
                newX = newX + scaleDistance
                continue
            }
            scalePath.move(to: CGPoint(x: newX, y: originY - 6))
            scalePath.addLine(to: CGPoint(x: newX, y: originY - 14))
            scalePath.close()
            newX = newX + scaleDistance
        }

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = scalePath.cgPath
        return shapeLayer
    }

    private func drawText(parent: UIView, originX: CGFloat, originY: CGFloat, targetLength: CGFloat) {

        let scaleDistance = CGFloat(targetLength) / 4.0
        var newX = originX

        for index in 0...3 {
            let textLayer = CATextLayer()
            textLayer.string = String(index * 6)
            textLayer.fontSize = 14
            textLayer.foregroundColor = UIColor.black.cgColor
            textLayer.frame = CGRect(x: newX - 10, y: originY - 40, width: 20, height: 15)
            textLayer.contentsScale = UIScreen.main.scale
            textLayer.alignmentMode = .center
            parent.layer.addSublayer(textLayer)
            newX = newX + scaleDistance
        }

    }

    private func drawValueLine(originX: CGFloat, originY: CGFloat, targetLength: CGFloat, startHour: Int, endHour: Int) -> CAShapeLayer {
        let scaleDistance = CGFloat(targetLength) / 24.0

        let startHourX = scaleDistance * CGFloat(startHour)
        let endHourX = scaleDistance * CGFloat(endHour)

        let scalePath = UIBezierPath()
        scalePath.move(to: CGPoint(x: originX + startHourX, y: originY - 10))
        scalePath.addLine(to: CGPoint(x: originX + endHourX, y: originY - 10))
        scalePath.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.path = scalePath.cgPath

        return shapeLayer
    }

}
