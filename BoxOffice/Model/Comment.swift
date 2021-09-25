//
//  Comment.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import Foundation

struct Comment: Codable {
    var rating: Double
    var timestamp: Double
    var writer: String
    var movieIdentifier: String
    var contents: String
    var identify: String
    
    enum CodingKeys: String, CodingKey {
        case rating
        case timestamp
        case writer
        case movieIdentifier = "movie_id"
        case contents
        case identify
    }
}
