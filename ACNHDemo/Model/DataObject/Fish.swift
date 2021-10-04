//
//  Fish.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/13.
//

import Foundation
import Alamofire

// MARK: - FishesValue
struct Fish: Codable {
    let id: Int
    let fileName: String
    let name: Name
    let availability: FishAvailability
    let shadow: String
    let price, priceCj: Int
    let catchPhrase, museumPhrase: String
    let imageURI, iconURI: String
    let altCatchPhrase: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, availability, shadow, price
        case priceCj = "price-cj"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
        case altCatchPhrase = "alt-catch-phrase"
    }
}

// MARK: - Availability
struct FishAvailability: Codable {
    let monthNorthern, monthSouthern: String
    let time: Time
    let isAllDay, isAllYear: Bool
    let location: Location
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

enum Location: String, Codable {
    case pier = "Pier"
    case pond = "Pond"
    case river = "River"
    case riverClifftop = "River (Clifftop)"
    case riverClifftopPond = "River (Clifftop) & Pond"
    case riverMouth = "River (Mouth)"
    case sea = "Sea"
    case seaWhenRainingOrSnowing = "Sea (when raining or snowing)"
}

typealias Fishes = [String: Fish]
