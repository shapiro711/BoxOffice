//
//  GetAPI.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/26.
//

import Foundation

enum GetAPI: APIable {
    
    case lookUpMovieList(orderType: Int, contentType: ContentType)
    case lookUpDetailMovie(id: String, contentType: ContentType)
    case lookUpComments(movieId: String, contentType: ContentType)
    
    var contentType: ContentType {
        switch self {
        case .lookUpDetailMovie(id: _, contentType: let contentType):
            return contentType
        case .lookUpComments(movieId: _, contentType: let contentType):
            return contentType
        case .lookUpMovieList(orderType: _, contentType: let contentType):
            return contentType
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .lookUpMovieList:
            return .get
        case .lookUpDetailMovie:
            return .get
        case .lookUpComments:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .lookUpMovieList(orderType: let orderType, contentType: _):
            return "\(NetworkManager.baseUrl)/movies?order_type=/\(orderType)"
        case .lookUpDetailMovie(id: let id, contentType: _):
            return "\(NetworkManager.baseUrl)/movie/\(id)"
        case .lookUpComments(movieId: let movieId, contentType: _):
            return "\(NetworkManager.baseUrl)/comments/\(movieId)"
        }
    }
    
    var param: [String : String?]? {
        switch self {
        case .lookUpMovieList:
            return nil
        case .lookUpDetailMovie:
            return nil
        case .lookUpComments:
            return nil
        }
    }
    
    var mediaFile: [Media]? {
        switch self {
        case .lookUpMovieList:
            return nil
        case .lookUpDetailMovie:
            return nil
        case .lookUpComments:
            return nil
        }
    }
}
