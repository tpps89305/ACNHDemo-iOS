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
}

extension ACNH : TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://acnhapi.com/v1/")!
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
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        switch self {
        case .villagers( _):
            return "WTF".data(using: String.Encoding.utf8)!
        case .songs( _):
            return "WTF".data(using: String.Encoding.utf8)!
        case .fishes(_):
            return "WTF".data(using: String.Encoding.utf8)!
        case .seaCreatures( _):
            return "WTF".data(using: String.Encoding.utf8)!
        case .bugs( _):
            return "WTF".data(using: String.Encoding.utf8)!
        }
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
}

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
    
    func mapNSDict() throws -> NSDictionary {
        let any = try self.mapJSON()
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
