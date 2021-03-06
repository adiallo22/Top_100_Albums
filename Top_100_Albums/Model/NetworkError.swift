//
//  NetworkError.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 8/2/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

enum NetworkError : Error {
    
    case urlFailed
    case serverResponseFailed
    case parsingFailed
    case failedLoadIMG
    
    var description: String {
        switch self {
            case .urlFailed: return "Failed to construct the URL from the given endpoint."
            case .serverResponseFailed: return "Failure to get a reponse from the server."
            case .parsingFailed: return "Failed parsing the JSon data."
            case .failedLoadIMG: return "Failed loading image"
        }
    }
    
}
