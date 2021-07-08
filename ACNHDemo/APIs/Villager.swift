// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let villagers = try? newJSONDecoder().decode(Villagers.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseVillagersValue { response in
//     if let villagersValue = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Villager
struct Villager: Codable {
    let id: Int
    let fileName: String
    let name: VillagerName
    let personality: Personality
    let birthdayString, birthday, species: String
    let gender: Gender
    let subtype: Subtype
    let hobby: Hobby
    let catchPhrase: String
    let iconURI, imageURI: String
    let bubbleColor, textColor, saying: String
    let catchTranslations: CatchTranslations

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, personality
        case birthdayString = "birthday-string"
        case birthday, species, gender, subtype, hobby
        case catchPhrase = "catch-phrase"
        case iconURI = "icon_uri"
        case imageURI = "image_uri"
        case bubbleColor = "bubble-color"
        case textColor = "text-color"
        case saying
        case catchTranslations = "catch-translations"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCatchTranslations { response in
//     if let catchTranslations = response.result.value {
//       ...
//     }
//   }

// MARK: - CatchTranslations
struct CatchTranslations: Codable {
    let catchUSen, catchEUen, catchEUde, catchEUes: String
    let catchUSes, catchEUfr, catchUSfr, catchEUit: String
    let catchEUnl, catchCNzh, catchTWzh, catchJPja: String
    let catchKRko, catchEUru: String

    enum CodingKeys: String, CodingKey {
        case catchUSen = "catch-USen"
        case catchEUen = "catch-EUen"
        case catchEUde = "catch-EUde"
        case catchEUes = "catch-EUes"
        case catchUSes = "catch-USes"
        case catchEUfr = "catch-EUfr"
        case catchUSfr = "catch-USfr"
        case catchEUit = "catch-EUit"
        case catchEUnl = "catch-EUnl"
        case catchCNzh = "catch-CNzh"
        case catchTWzh = "catch-TWzh"
        case catchJPja = "catch-JPja"
        case catchKRko = "catch-KRko"
        case catchEUru = "catch-EUru"
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

enum Hobby: String, Codable {
    case education = "Education"
    case fashion = "Fashion"
    case fitness = "Fitness"
    case music = "Music"
    case nature = "Nature"
    case play = "Play"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseName { response in
//     if let name = response.result.value {
//       ...
//     }
//   }

// MARK: - Name
struct VillagerName: Codable {
    let nameUSen, nameEUen, nameEUde, nameEUes: String
    let nameUSes, nameEUfr, nameUSfr, nameEUit: String
    let nameEUnl, nameCNzh, nameTWzh, nameJPja: String
    let nameKRko, nameEUru: String

    enum CodingKeys: String, CodingKey {
        case nameUSen = "name-USen"
        case nameEUen = "name-EUen"
        case nameEUde = "name-EUde"
        case nameEUes = "name-EUes"
        case nameUSes = "name-USes"
        case nameEUfr = "name-EUfr"
        case nameUSfr = "name-USfr"
        case nameEUit = "name-EUit"
        case nameEUnl = "name-EUnl"
        case nameCNzh = "name-CNzh"
        case nameTWzh = "name-TWzh"
        case nameJPja = "name-JPja"
        case nameKRko = "name-KRko"
        case nameEUru = "name-EUru"
    }
}

enum Personality: String, Codable {
    case cranky = "Cranky"
    case jock = "Jock"
    case normal = "Normal"
    case peppy = "Peppy"
    case personalityLazy = "Lazy"
    case smug = "Smug"
    case snooty = "Snooty"
    case uchi = "Uchi"
}

enum Subtype: String, Codable {
    case a = "A"
    case b = "B"
}

typealias Villagers = [String: Villager]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
