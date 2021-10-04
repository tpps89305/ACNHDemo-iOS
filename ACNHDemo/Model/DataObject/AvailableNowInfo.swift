//
//  AvailableNowInfo.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/21.
//

import UIKit

class AvailableNowInfo {
    let name: String
    var amount: Int
    let icon: UIImage?
    
    init(name: String, amount: Int, iconName: String) {
        self.name = name
        self.amount = amount
        self.icon = UIImage.init(named: iconName)
    }
}
