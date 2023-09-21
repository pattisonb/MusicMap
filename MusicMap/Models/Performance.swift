//
//  Performance.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import Foundation


struct Performance: Codable {
    let artistId: Int?
    let date: Date?
    let id: Int?
    let venueId: Int?
    
    private enum CodingKeys: String, CodingKey {
        case artistId, date, id, venueId
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        artistId = try container.decodeIfPresent(Int.self, forKey: .artistId)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        venueId = try container.decodeIfPresent(Int.self, forKey: .venueId)
        
        //decode date string in date object
        let dateString = try container.decode(String.self, forKey: .date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        date = dateFormatter.date(from: dateString)
    }
}
