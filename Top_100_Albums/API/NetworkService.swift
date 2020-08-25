//
//  NetworkService.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/29/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation
import UIKit.UIImage

struct NetworkService {
    
    var cache = NSCache<NSString, UIImage>()
    
    static let shared = NetworkService.init()
    
    func getTopHundredAlbums(withEndpoint endpoint: String, completion: @escaping(Result<[Album], NetworkError>) -> Void) {
        guard let url = URL.init(string: endpoint) else {
            completion(.failure(.urlFailed))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(.serverResponseFailed))
            } else {
                if let data = data {
                    guard let albums = DataParser.parseWithCodable(data) else {
                        completion(.failure(.parsingFailed))
                        return
                    }
                    DispatchQueue.main.async {
                        completion(.success(albums))
                    }
                }
            }
        }.resume()
    }
    
    func downloadImage(withURL url : URL, completion: @escaping(UIImage?) -> Void) {
        if let cahcedIMG = cache.object(forKey: url.absoluteString as NSString) {
            print("image is cached..")
            completion(cahcedIMG)
        } else {
            DispatchQueue.global(qos: .background).async {
                guard let data = try? Data.init(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    guard let image = UIImage.init(data: data) else { return }
                    self.cache.setObject(image, forKey: url.absoluteString as NSString)
                    print("image is not cached..")
                    completion(image)
                }
            }
        }
    }
    
}
