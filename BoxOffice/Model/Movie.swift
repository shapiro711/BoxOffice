//
//  Movie.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import Foundation

struct Moive: Codable {
    var audience: Int
    var actor: String
    var duration: Int
    var director: String
    var synopsis: String
    var genre: String
    var grade: Int
    var image: String
    var reservationGrade: Int
    var title: String
    var reservationRate: Double
    var userRating: Double
    var date: String
    var identify: String
    
    enum CondingKeys: String, CodingKey {
        case audience
        case actor
        case duration
        case director
        case synopsis
        case genre
        case grade
        case image
        case reservationGrade = "reservation_grade"
        case title
        case reservationRate = "reservation_rate"
        case userRating = "user_rating"
        case date
        case identify
    }
}
