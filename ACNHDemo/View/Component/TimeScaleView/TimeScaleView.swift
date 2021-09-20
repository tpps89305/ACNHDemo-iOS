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

    var startEndTimeArray: [[Int]] = []
    var currentHour = -1
    var currentMinute = -1

    override func awakeFromNib() {
        super.awakeFromNib()

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let currentTime = formatter.string(from: Date())
        currentHour = Int(currentTime.split(separator: ":")[0]) ?? -1
        currentMinute = Int(currentTime.split(separator: ":")[1]) ?? -1
    }

    override func layoutSubviews() {
        print("layoutSubviews: \(frame)")

        let padding: CGFloat = 10
        let drawOriginX = padding
        let drawOriginY = frame.height - 10
        let drawTargetLength = frame.width - padding * 2

        for eachStartEndTime in startEndTimeArray {
            layer.addSublayer(
                    drawValueLine(originX: drawOriginX,
                            originY: drawOriginY,
                            targetLength: drawTargetLength,
                            startHour: eachStartEndTime.first!,
                            endHour: eachStartEndTime.last!
                    ))
        }

        layer.addSublayer(drawBottomLine(originX: drawOriginX - 1, originY: drawOriginY, targetLength: drawTargetLength + 2))
        layer.addSublayer(drawScaleLine(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength))
        layer.addSublayer(drawScaleLine2(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength))
        layer.addSublayer(drawScaleLine3(originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength))
        layer.addSublayer(
                drawCurrentTimeLine(originX: drawOriginX,
                        originY: drawOriginY,
                        targetLength: drawTargetLength,
                        currentHour: currentHour,
                        currentMinute: currentMinute)
        )
        drawText(parent: self, originX: drawOriginX, originY: drawOriginY, targetLength: drawTargetLength)
    }

    func drawTimeScale(time: Time?) {
        startEndTimeArray = []

        switch time {
        case .empty:
            startEndTimeArray.append([0, 24])
            break
        case .the4Am9Pm:
            startEndTimeArray.append([4, 21])
            break
        case .the4Pm9Am:
            startEndTimeArray.append([16, 24])
            startEndTimeArray.append([0, 9])
            break
        case .the9Am4Pm:
            startEndTimeArray.append([9, 16])
            break
        case .the9Am4Pm9Pm4Am:
            startEndTimeArray.append([9, 16])
            startEndTimeArray.append([21, 24])
            startEndTimeArray.append([0, 4])
            break
        case .the9Pm4Am:
            startEndTimeArray.append([21, 24])
            startEndTimeArray.append([0, 4])
            break
        case .none:
            break
        }

        print("drawTimeScale: \(frame)")
        print("startEndTimeArray: \(startEndTimeArray)")
    }

    func drawTimeScale(arrayTime: [Int]) {
        startEndTimeArray = []

        var start = -1
        var end = -1

        for index in 0...arrayTime.count - 1 {
            if start == -1 {
                start = arrayTime[index]
                continue
            }
            if arrayTime[index] - arrayTime[index - 1] != 1 {
                end = arrayTime[index - 1] + 1
                startEndTimeArray.append([start, end])
                start = arrayTime[index]
                continue
            }
            if index == arrayTime.count - 1 {
                end = arrayTime[index] + 1
                startEndTimeArray.append([start, end])
            }
        }

        print("drawTimeScale: \(frame)")
        print("startEndTimeArray: \(startEndTimeArray)")
    }

    private func drawBottomLine(originX: CGFloat, originY: CGFloat, targetLength: CGFloat) -> CAShapeLayer {
        let bottomLine = UIBezierPath()
        bottomLine.move(to: CGPoint(x: originX, y: originY))
        bottomLine.addLine(to: CGPoint(x: originX + targetLength, y: originY))
        bottomLine.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2
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
        shapeLayer.lineWidth = 1
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
            textLayer.frame = CGRect(x: newX - 10, y: originY - 45, width: 20, height: 15)
            textLayer.contentsScale = UIScreen.main.scale
            textLayer.alignmentMode = .center
            parent.layer.addSublayer(textLayer)
            newX = newX + scaleDistance
        }
    }

    private func drawValueLine(originX: CGFloat, originY: CGFloat, targetLength: CGFloat,
                               startHour: Int, endHour: Int) -> CAShapeLayer {
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

    private func drawCurrentTimeLine(originX: CGFloat, originY: CGFloat, targetLength: CGFloat,
                                     currentHour: Int, currentMinute: Int) -> CAShapeLayer {
        if currentHour == -1 || currentMinute == -1 {
            print("Cannot load current time, return empty CAShapeLayer.")
            return CAShapeLayer()
        }
        let scaleDistance = CGFloat(targetLength) / 1440.0
        let currentTimeX = scaleDistance * (CGFloat(currentHour) * 60 + CGFloat(currentMinute))

        let scalePath = UIBezierPath()
        scalePath.move(to: CGPoint(x: originX + currentTimeX, y: originY + 5))
        scalePath.addLine(to: CGPoint(x: originX + currentTimeX, y: originY - 25))
        scalePath.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.systemPink.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.path = scalePath.cgPath

        return shapeLayer
    }

}
