//
//  NetworkService.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/29/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService.init()
    
    func getTopHundredAlbums(withEndpoint endpoint: String, completion: @escaping(Result<[Album], Error>) -> Void) {
        guard let url = URL.init(string: endpoint) else {
            completion(.failure("Failed to construct the URL" as! Error))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(error!))
            } else {
                if let data = data {
                    do {
                        var albums : [Album] = []
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                        guard let feed = json?["feed"] as? [String:Any] else { return }
                        guard let results = feed["results"] as? NSArray else { return }
                        for result in results {
                            guard let result = result as? [String:Any] else { return }
                            guard let artistName = result["artistName"] as? String,
                                let artworkUrl100 = result["artworkUrl100"] as? String,
                                let name = result["name"] as? String else { return }
                            let album = Album.init(name: name, artist: artistName, thumbnail: artworkUrl100)
                            albums.append(album)
                            completion(.success(albums))
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }.resume()
    }
    
}
