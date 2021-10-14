import Foundation
import Alamofire

// MARK: - Villager
struct Villager: Codable {
    let villagerId: Int
    let fileName: String
    let name: Name
    let personality: Personality
    let birthdayString, birthday, species: String
    let gender: Gender
    let subtype: String
    let hobby: Hobby
    let catchPhrase: String
    let iconURI, imageURI: String
    let bubbleColor, textColor, saying: String
    let catchTranslations: CatchTranslations

    enum CodingKeys: String, CodingKey {
        case villagerId = "id"
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

typealias Villagers = [String: Villager]
