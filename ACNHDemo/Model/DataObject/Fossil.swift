//
//  Fossil.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import Foundation

// MARK: - FossilsValue
struct Fossil: Codable {
    let fileName: String
    let name: Name
    let price: Int
    let museumPhrase: String
    let imageURI: String
    let partOf: String

    enum CodingKeys: String, CodingKey {
        case fileName = "file-name"
        case name, price
        case museumPhrase = "museum-phrase"
        case imageURI = "image_uri"
        case partOf = "part-of"
    }
}

typealias Fossils = [String: Fossil]
