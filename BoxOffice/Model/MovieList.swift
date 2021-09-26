//
//  MovieList.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/26.
//

import Foundation

struct MovieList: Codable {
    var orderType: Int
    var movies: [MovieThumbnail]
    
    enum CodingKeys: String, CodingKey {
        case orderType = "order_type"
        case movies
    }
}
