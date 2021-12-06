//
//  TitleIconPair.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/10.
//

import Foundation
import UIKit

class TitleIconPair {
    var title: String
    var icon: UIImage?
    
    init(title: String, iconName: String) {
        self.title = title
        self.icon = UIImage(named: iconName)
    }
    
    init(title: String, icon: UIImage?) {
        self.title = title
        self.icon = icon
    }
    
}
