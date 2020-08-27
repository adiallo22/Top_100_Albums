//
//  NetworkServiceTest.swift
//  Top_100_AlbumsTests
//
//  Created by Abdul Diallo on 8/2/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import XCTest
@testable import Top_100_Albums

class NetworkServiceTest: XCTestCase {
    
    let URLFailingEndpoint = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
    let goodEndpoint = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"

    override func setUpWithError() throws {
        
    }
    
//    func testFailing_Network_Call_With_Bad_URL() {
//        NetworkService.shared.getTopHundredAlbums(withEndpoint: URLFailingEndpoint) { result in
//            switch result {
//            case .success(let articles):
//                XCTAssertNil(articles)
//            case .failure(let error):
//                XCTAssert(error.description == "NetworkError.urlFailed.description")
//            }
//        }
//    }
    
//    func testReturning_100Albums_From_Server() {
//        NetworkService.shared.getTopHundredAlbums(withEndpoint: goodEndpoint) { result in
//            switch result {
//            case .success(let albums):
//                XCTAssertEqual(albums.count, 100)
//            case .failure(let error):
//                XCTAssertNil(error)
//            }
//        }
//    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

}
