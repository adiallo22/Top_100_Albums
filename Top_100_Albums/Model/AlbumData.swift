//
//  AlbumData.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 8/17/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

//let genre : String

struct AlbumJSON : Codable {
    
    struct FeedJSON : Codable {
        struct Result : Codable {
            var artistName : String
            var artworkUrl100 : String
            var releaseDate : String
            struct Genre : Codable {
                var name : String
            }
            var name : String
            var genres : [Genre]
            var url : String
            var copyright : String?
        }
        var results : [Result]
    }
    var feed : FeedJSON
    
}
