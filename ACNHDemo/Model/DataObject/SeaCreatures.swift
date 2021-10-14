//
//  SeaCreatures.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import Foundation
import Alamofire

// MARK: - SeaCreaturesValue
struct SeaCreature: Codable {
    let seaCreatureId: Int
    let fileName: String
    let name: Name
    let availability: SeaCreatureAvailability
    let speed: Speed
    let shadow: Shadow
    let price: Int
    let catchPhrase: String
    let imageURI, iconURI: String
    let museumPhrase: String

    enum CodingKeys: String, CodingKey {
        case seaCreatureId = "id"
        case fileName = "file-name"
        case name, availability, speed, shadow, price
        case catchPhrase = "catch-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
        case museumPhrase = "museum-phrase"
    }
}

// MARK: - Availability
struct SeaCreatureAvailability: Codable {
    let monthNorthern, monthSouthern: String
    let time: Time
    let isAllDay, isAllYear: Bool
    let monthArrayNorthern, monthArraySouthern, timeArray: [Int]

    enum CodingKeys: String, CodingKey {
        case monthNorthern = "month-northern"
        case monthSouthern = "month-southern"
        case time, isAllDay, isAllYear
        case monthArrayNorthern = "month-array-northern"
        case monthArraySouthern = "month-array-southern"
        case timeArray = "time-array"
    }
}

enum Shadow: String, Codable {
    case large = "Large"
    case largest = "Largest"
    case medium = "Medium"
    case small = "Small"
    case smallest = "Smallest"
}

enum Speed: String, Codable {
    case fast = "Fast"
    case medium = "Medium"
    case slow = "Slow"
    case stationary = "Stationary"
    case veryFast = "Very fast"
    case verySlow = "Very slow"
}

typealias SeaCreatures = [String: SeaCreature]
