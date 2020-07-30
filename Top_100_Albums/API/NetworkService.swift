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
                    guard let albums = self.parseJSON(data) else { return }
                    DispatchQueue.main.async {
                        completion(.success(albums))
                    }
                }
            }
        }.resume()
    }
    
}

//MARK: - helpers

extension NetworkService {
    
    fileprivate func parseJSON(_ data: Data) -> [Album]? {
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
    
}
