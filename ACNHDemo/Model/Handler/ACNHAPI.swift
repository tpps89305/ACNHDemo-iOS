//
//  ACNHAPI.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/5/23.
//

import Foundation
import Moya

let ACNHProvider = MoyaProvider<ACNH>()

public enum ACNH {
    case villagers(villagerId: Int)
    case songs(songId: Int)
    case fishes(fishId: Int)
    case seaCreatures(seaCreatureId: Int)
    case bugs(bugId: Int)
    case fossils(fossilId: Int)
    case art(ardId: Int)
    case backgroundmusic(bgmId: Int)
    case houseware(housewareId: Int)
    case wallmounted(wallmountedId: Int)
}

extension ACNH : TargetType {
    
    public var baseURL: URL {
        URL(string: "https://acnhapi.com/v1/")!
    }
    
    public var path: String {
        switch self {
        case .villagers(let villagerId):
            if villagerId == 0 {
                return "villagers/"
            }
            return "villagers/\(villagerId)"
        case .songs(let songId):
            if songId == 0 {
                return "songs/"
            }
            return "songs/\(songId)"
        case .fishes(let fishId):
            if fishId == 0 {
                return "fish/"
            }
            return "fish/\(fishId)"
        case .seaCreatures(let seaCreatureId):
            if seaCreatureId == 0 {
                return "sea/"
            }
            return "sea/\(seaCreatureId)"
        case .bugs(let bugId):
            if bugId == 0 {
                return "bugs/"
            }
            return "bugs/\(bugId)"
        case .fossils(let fossilId):
            if fossilId == 0 {
                return "fossils/"
            }
            return "fossils/\(fossilId)"
        case .art(let artId):
            if artId == 0 {
                return "art/"
            }
            return "art/\(artId)"
        case .backgroundmusic(let bgmId):
            if bgmId == 0 {
                return "backgroundmusic/"
            }
            return "backgroundmusic/\(bgmId)"
        case .houseware(let housewareId):
            if housewareId == 0 {
                return "houseware/"
            }
            return "houseware/\(housewareId)"
        case .wallmounted(let wallmountedId):
            if wallmountedId == 0 {
                return "wallmounted/"
            }
            return "wallmounted/\(wallmountedId)"
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var sampleData: Data {
        switch self {
        case .villagers:
            return "WTF".data(using: String.Encoding.utf8)!
        case .songs:
            return "WTF".data(using: String.Encoding.utf8)!
        case .fishes:
            return "WTF".data(using: String.Encoding.utf8)!
        case .seaCreatures:
            return "WTF".data(using: String.Encoding.utf8)!
        case .bugs:
            return "WTF".data(using: String.Encoding.utf8)!
        case .fossils:
            return "WTF".data(using: String.Encoding.utf8)!
        case .art:
            return "WTF".data(using: String.Encoding.utf8)!
        case .backgroundmusic:
            return "WTF".data(using: String.Encoding.utf8)!
        case .houseware:
            return "WTF".data(using: String.Encoding.utf8)!
        case .wallmounted:
            return "WTF".data(using: String.Encoding.utf8)!
        }
    }
    
    public var task: Task {
        .requestPlain
    }
    
    public var headers: [String : String]? {
        nil
    }
    
}

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
    
    func mapNSDict() throws -> NSDictionary {
        let any = try mapJSON()
        guard let array = any as? NSDictionary else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

// MARK: - Helper functions for creating encoders and decoders

func ACNHJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func ACNHJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
