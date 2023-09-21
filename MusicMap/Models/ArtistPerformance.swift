//
//  ArtistPerformance.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import Foundation


struct ArtistPerformance: Codable {
    let artistId: Int?
    let date: Date?
    let id: Int?
    let venue: Venue?
    
    private enum CodingKeys: String, CodingKey {
        case artistId, date, id, venue
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        artistId = try container.decodeIfPresent(Int.self, forKey: .artistId)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        venue = try container.decodeIfPresent(Venue.self, forKey: .venue)

        //decode date string in date object
        let dateString = try container.decode(String.self, forKey: .date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        date = dateFormatter.date(from: dateString)
    }
}

