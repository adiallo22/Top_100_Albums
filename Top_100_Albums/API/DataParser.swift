//
//  DataParser.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 8/24/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct DataParser {
    
    static func parseData(_ data: Data) -> [Album]? {
        var albums : [Album] = []
        let decoder = JSONDecoder()
        do {
            let dataDecoded = try decoder.decode(AlbumJSON.self, from: data)
            for album in dataDecoded.feed.results {
                let thumbnail = album.artworkUrl100
                let name = album.name
                let release = album.releaseDate
                let genre = album.genres[0].name
                let artist = album.artistName
                let url = album.url
                let copyright = album.copyright
                let alb = Album.init(name: name,
                                     artist: artist,
                                     thumbnail: thumbnail,
                                     copyright: copyright ?? "",
                                     releaseDate: release,
                                     genre: genre,
                                     url: url)
                albums.insert(alb, at: 0)
            }
        } catch {
            print(NetworkError.parsingFailed.description)
        }
        return albums
    }
    
}
