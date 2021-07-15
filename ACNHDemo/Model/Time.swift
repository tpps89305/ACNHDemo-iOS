//
//  Time.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import Foundation

enum Time: String, Codable {
    case empty = ""
    case the4Am9Pm = "4am - 9pm"
    case the4Pm9Am = "4pm - 9am"
    case the9Am4Pm = "9am - 4pm"
    case the9Am4Pm9Pm4Am = "9am - 4pm & 9pm - 4am"
    case the9Pm4Am = "9pm - 4am"
}
