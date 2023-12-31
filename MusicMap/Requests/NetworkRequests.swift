//
//  NetworkRequests.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import Foundation
import Alamofire

class NetworkRequests {
    let apiUrl = "http://ec2-44-211-66-223.compute-1.amazonaws.com"
    
    //MARK: Artist Calls
    func getAllArtists(completion: @escaping ([Artist]?) -> ()) {
        AF.request("\(apiUrl)/artists", method: .get, parameters: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                let jsonData = try? JSONDecoder().decode([Artist].self, from: data)
                completion(jsonData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getArtist(artistID: Int, completion: @escaping (Artist?) -> ()) {
        AF.request("\(apiUrl)/artists/\(artistID)", method: .get, parameters: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                let jsonData = try? JSONDecoder().decode(Artist.self, from: data)
                completion(jsonData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getArtistPerformances(artistId: Int, fromDate: String?, toDate: String?, completion: @escaping ([ArtistPerformance]?) -> ()) {
        var adjustedURl = "\(apiUrl)/artists/\(artistId)/performances"
        if let from = fromDate {
            adjustedURl += "?from=\(from)"
        }
        if let to = toDate {
            if fromDate != nil {
                adjustedURl += "&"
            }
            else {
                adjustedURl += "?"
            }
            adjustedURl += "to=\(to)"
        }
        AF.request(adjustedURl, method: .get, parameters: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                let jsonData = try? JSONDecoder().decode([ArtistPerformance].self, from: data)
                completion(jsonData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK: Venue Calls
    func getAllVenues(completion: @escaping ([Venue]?) -> ()) {
        AF.request("\(apiUrl)/venues", method: .get, parameters: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                let jsonData = try? JSONDecoder().decode([Venue].self, from: data)
                completion(jsonData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getVenue(venueID: Int, completion: @escaping (Venue?) -> ()) {
        AF.request("\(apiUrl)/artists/\(venueID)", method: .get, parameters: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                let jsonData = try? JSONDecoder().decode(Venue.self, from: data)
                completion(jsonData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getVenuePerformances(venueId: Int, fromDate: String?, toDate: String?, completion: @escaping ([VenuePerformance]?) -> ()) {
        var adjustedURl = "\(apiUrl)/venues/\(venueId)/performances"
        if let from = fromDate {
            adjustedURl += "?from=\(from)"
        }
        if let to = toDate {
            if fromDate != nil {
                adjustedURl += "&"
            }
            else {
                adjustedURl += "?"
            }
            adjustedURl += "to=\(to)"
        }
        AF.request(adjustedURl, method: .get, parameters: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                let jsonData = try? JSONDecoder().decode([VenuePerformance].self, from: data)
                completion(jsonData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
