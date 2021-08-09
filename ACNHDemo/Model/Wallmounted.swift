//
//  Wallmounted.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/6.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wallmounted = try? newJSONDecoder().decode(Wallmounted.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.wallmountedElementTask(with: url) { wallmountedElement, response, error in
//     if let wallmountedElement = wallmountedElement {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - WallmountedElement
struct Wallmounted: Codable {
    let variant, bodyTitle, pattern: String?
    let patternTitle: PatternTitle?
    let isDIY, canCustomizeBody, canCustomizePattern: Bool
    let kitCost: String?
    let color1, color2: Color
    let size: Size
    let source: Source
    let sourceDetail: String
    let version: Version
    let hhaConcept1, hhaConcept2: HhaConcept?
    let hhaSeries, hhaSet: String?
    let isInteractive: Bool
    let tag: String
    let isOutdoor: Bool
    let lightingType: LightingType?
    let isDoorDeco, isCatalog: Bool
    let fileName: String
    let variantID: String?
    let internalID: Int
    let name: Name
    let buyPrice: Int?
    let sellPrice: Int
    let imageURI: String

    enum CodingKeys: String, CodingKey {
        case variant
        case bodyTitle = "body-title"
        case pattern
        case patternTitle = "pattern-title"
        case isDIY, canCustomizeBody, canCustomizePattern
        case kitCost = "kit-cost"
        case color1 = "color-1"
        case color2 = "color-2"
        case size, source
        case sourceDetail = "source-detail"
        case version
        case hhaConcept1 = "hha-concept-1"
        case hhaConcept2 = "hha-concept-2"
        case hhaSeries = "hha-series"
        case hhaSet = "hha-set"
        case isInteractive, tag, isOutdoor
        case lightingType = "lighting-type"
        case isDoorDeco, isCatalog
        case fileName = "file-name"
        case variantID = "variant-id"
        case internalID = "internal-id"
        case name
        case buyPrice = "buy-price"
        case sellPrice = "sell-price"
        case imageURI = "image_uri"
    }
}

enum PatternTitle: String, Codable {
    case clockFace = "Clock face"
    case design = "Design"
    case favoriteCard = "Favorite card"
    case signature = "Signature"
}

typealias Wallmounteds = [String: [Wallmounted]]
