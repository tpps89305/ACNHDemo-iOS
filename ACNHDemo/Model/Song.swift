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
    let name: Name
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

typealias Songs = [String: Song]
