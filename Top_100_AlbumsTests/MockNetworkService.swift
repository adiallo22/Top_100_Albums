//
//  MockNetworkService.swift
//  Top_100_AlbumsTests
//
//  Created by Abdul Diallo on 9/18/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
@testable import Top_100_Albums

class MockNetworkService {
    
    var returnAlbumsWasCalled = false
    var returnImageWasCalled = false
    var shouldReturnError = false
    
    let mockAlbums : [Album] = [
        Album.init(name: "test",
                   artist: "test",
                   thumbnail: "test",
                   copyright: "test",
                   releaseDate: "test",
                   genre: "test",
                   url: "test")
    ]
    let mockImage = #imageLiteral(resourceName: "Placeholder")
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    convenience init() {
        self.init(false)
    }
    
    func reset() {
        returnAlbumsWasCalled = false
        returnImageWasCalled = false
        shouldReturnError = false
    }
    
}

//MARK: - NetworkServiceInterface

extension MockNetworkService : NetworkServiceInterface {
    
    func getTopHundredAlbums(withEndpoint endpoint: String, completion: @escaping (Result<[Album], NetworkError>) -> Void) {
        returnAlbumsWasCalled = true
        if shouldReturnError {
            completion(.failure(.serverResponseFailed))
        } else {
            completion(.success(mockAlbums))
        }
    }
    
    func downloadImage(withURL url: URL, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        returnImageWasCalled = true
        if shouldReturnError {
            completion(.failure(.failedLoadIMG))
        } else {
            completion(.success(mockImage))
        }
    }

}
