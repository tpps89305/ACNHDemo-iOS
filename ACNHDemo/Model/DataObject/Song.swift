import Foundation
import Alamofire

// MARK: - Song
struct Song: Codable {
    let songId: Int
    let fileName: String
    let name: Name
    let buyPrice: Int?
    let sellPrice: Int
    let isOrderable: Bool
    let musicURI, imageURI: String

    enum CodingKeys: String, CodingKey {
        case songId = "id"
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
