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
    
    func getTopHundredAlbums(withEndpoint endpoint: String, completion: @escaping(Result<String, Error>) -> Void) {
        guard let url = URL.init(string: endpoint) else {
            print("Failed constructing the URL")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                        print(json)
                    } catch {
                        print("error")
                    }
                }
            }
        }.resume()
    }
    
}
