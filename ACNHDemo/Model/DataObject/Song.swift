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

typealias Songs = [String: Song]
