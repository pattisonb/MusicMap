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
