//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSongsValue { response in
//     if let songsValue = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Song
struct Song: Codable {
    let id: Int
    let fileName: String
    let name: SongName
    let buyPrice: Int?
    let sellPrice: Int
    let isOrderable: Bool
    let musicURI, imageURI: String

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name
        case buyPrice = "buy-price"
        case sellPrice = "sell-price"
        case isOrderable
        case musicURI = "music_uri"
        case imageURI = "image_uri"
    }
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
struct SongName: Codable {
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

typealias Songs = [String: Song]
