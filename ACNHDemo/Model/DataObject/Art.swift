//
//  Art.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import Foundation

// MARK: - ArtValue
struct ArtValue: Codable {
    let artId: Int
    let fileName: String
    let name: Name
    let hasFake: Bool
    let buyPrice, sellPrice: Int
    let imageURI: String
    let museumDesc: String

    enum CodingKeys: String, CodingKey {
        case artId = "id"
        case fileName = "file-name"
        case name, hasFake
        case buyPrice = "buy-price"
        case sellPrice = "sell-price"
        case imageURI = "image_uri"
        case museumDesc = "museum-desc"
    }
}

typealias Art = [String: ArtValue]
