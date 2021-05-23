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
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        switch self {
        case .villagers( _):
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

