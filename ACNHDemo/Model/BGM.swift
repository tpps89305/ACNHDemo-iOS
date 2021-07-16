//
//  BGM.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import Foundation

// MARK: - BGMValue
struct BGM: Codable {
    let id: Int
    let fileName: String
    let hour: Int
    let weather: Weather
    let musicURI: String

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case hour, weather
        case musicURI = "music_uri"
    }
}

enum Weather: String, Codable {
    case rainy = "Rainy"
    case snowy = "Snowy"
    case sunny = "Sunny"
}

typealias Bgms = [String: BGM]
