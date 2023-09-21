//
//  NetworkRequests.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import Foundation
import Alamofire

let apiUrl = "http://ec2-44-211-66-223.compute-1.amazonaws.com"

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
    print(adjustedURl)
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
    print(adjustedURl)
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
