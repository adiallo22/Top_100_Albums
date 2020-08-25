//
//  DataParser.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 8/24/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct DataParser {
    
    static func parseJSON(_ data: Data) -> [Album]? {
        var albums : [Album] = []
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
            guard let feed = json?["feed"] as? [String:Any] else { return nil }
            guard let results = feed["results"] as? NSArray else { return nil }
            for result in results {
                guard let result = result as? [String:Any] else { return nil }
                let artistName = result["artistName"] as? String ?? ""
                let artworkUrl100 = result["artworkUrl100"] as? String ?? ""
                let name = result["name"] as? String ?? ""
                let copyright = result["copyright"] as? String ?? ""
                let releaseDate = result["releaseDate"] as? String ?? ""
                let genres = result["genres"] as? [[String:Any]]  ?? [["1":1]]
                let genresName = genres[0]["name"] as? String ?? "Music"
                let url = result["url"] as? String ?? ""
                let album = Album.init(name: name,
                                       artist: artistName,
                                       thumbnail: artworkUrl100,
                                       copyright: copyright,
                                       releaseDate: releaseDate,
                                       genre: genresName, url: url)
                albums.append(album)
            }
        } catch let error {
            print("ERROR PARSING - \(error.localizedDescription)")
        }
        return albums
    }
    
    static fileprivate func pars(_ data: Data) -> [Album]? {
        var albums : [Album] = []
        do {
            let dataDecoded = try JSONDecoder().decode(AlbumJSON.self, from: data)
            for album in dataDecoded.feed.results {
                print(album.artistName)
                print(album.url)
                print(album.genres.name)
                //                let thumbnail = album.artworkUrl100
                //                let copyright = album.copyright
                //                let fname = album.name
                //                let release = album.releaseDate
                //                let a = Album.init(name: name, artist: fname, thumbnail: "thumbnail", copyright: copyright, releaseDate: release, genre: "hi", url: "xoxo")
                //                print(a)
                print("-----")
                //                albums.insert(a, at: 0)
            }
        } catch {
            print("error parsing")
        }
        return albums
    }
    
}
