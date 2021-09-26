//
//  APIable.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/26.
//

import Foundation


protocol APIable {
    var contentType: ContentType { get }
    var requestType: RequestType { get }
    var url: String { get }
    var param: [String: String?]? { get }
    var mediaFile: [Media]? { get }
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
    
    var method: String {
        return self.rawValue
    }
}

enum ContentType {
    case multiPartForm
    case jsonData
    case noBody
    
    var description: String {
        switch self {
        case .multiPartForm:
            return "multipart/form-data"
        case .jsonData:
            return "aplication/json"
        case .noBody:
            return ""
        }
    }
}
