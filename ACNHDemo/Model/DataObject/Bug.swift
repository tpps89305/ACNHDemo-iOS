//
//  File.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import Foundation
import Alamofire

// MARK: - Bug
struct Bug: Codable {
    let bugId: Int
    let fileName: String
    let name: Name
    let availability: BugAvailability
    let price, priceFlick: Int
    let catchPhrase, museumPhrase: String
    let imageURI, iconURI: String
    let altCatchPhrase: [String]?

    enum CodingKeys: String, CodingKey {
        case bugId = "id"
        case fileName = "file-name"
        case name, availability, price
        case priceFlick = "price-flick"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
        case altCatchPhrase = "alt-catch-phrase"
    }
}

// MARK: - Availability
struct BugAvailability: Codable {
    let monthNorthern, monthSouthern, time: String
    let isAllDay, isAllYear: Bool
    let location: String
    let rarity: Rarity
    let monthArrayNorthern, monthArraySouthern, timeArray: [Int]

    enum CodingKeys: String, CodingKey {
        case monthNorthern = "month-northern"
        case monthSouthern = "month-southern"
        case time, isAllDay, isAllYear, location, rarity
        case monthArrayNorthern = "month-array-northern"
        case monthArraySouthern = "month-array-southern"
        case timeArray = "time-array"
    }
}

typealias Bugs = [String: Bug]
