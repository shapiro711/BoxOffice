//
//  ParssingManager.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import Foundation

struct ParssingManager {
    
    static func decodingModel<T: Decodable>(data: Data, model: T.Type) -> T? {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: data)
        return model
    }
    
    static func encodingModel(model: [String: String?]?) -> Data? {
        let encoder = JSONEncoder()
        let convertedData = try? encoder.encode(model)
        return convertedData
    }
}
