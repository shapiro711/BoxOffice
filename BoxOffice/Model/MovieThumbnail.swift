//
//  MovieThubnail.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/26.
//

import Foundation

struct MovieThumbnail: Codable {
    var grade: Int
    var thumbNail: String
    var reservationGrade: Int
    var title: String
    var reservationRate: Double
    var userRating: Double
    var date: String
    var identifier: String
    
    enum CodingKeys: String, CodingKey {
        case grade
        case thumbNail = "thumb"
        case reservationGrade = "reservation_grade"
        case title
        case reservationRate = "reservation_rate"
        case userRating = "user_rating"
        case date
        case identifier = "id"
    }
}
