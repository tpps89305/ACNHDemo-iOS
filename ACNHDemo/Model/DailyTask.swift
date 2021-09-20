//
//  DailyTask.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/20.
//

import UIKit

class DailyTask: NSObject {
    let iconName: String
    let currentValue: Double
    let maxValue: Double
    
    init(iconName: String, currentValue: Double, maxValue: Double) {
        self.iconName = iconName
        self.currentValue = currentValue
        self.maxValue = maxValue
    }
}
