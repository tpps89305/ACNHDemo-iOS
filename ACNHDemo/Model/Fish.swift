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
    let availability: Availability
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

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAvailability { response in
//     if let availability = response.result.value {
//       ...
//     }
//   }

// MARK: - Availability
struct Availability: Codable {
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

enum Rarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case ultraRare = "Ultra-rare"
    case uncommon = "Uncommon"
}

enum Time: String, Codable {
    case empty = ""
    case the4Am9Pm = "4am - 9pm"
    case the4Pm9Am = "4pm - 9am"
    case the9Am4Pm = "9am - 4pm"
    case the9Am4Pm9Pm4Am = "9am - 4pm & 9pm - 4am"
    case the9Pm4Am = "9pm - 4am"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseName { response in
//     if let name = response.result.value {
//       ...
//     }
//   }

typealias Fishes = [String: Fish]
