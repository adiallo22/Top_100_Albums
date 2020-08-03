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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testGet_100AlbumsReturned_FromServer() {
        NetworkService.shared.getTopHundredAlbums(withEndpoint: URLFailingEndpoint) { result in
            switch result {
            case .success(let articles):
                XCTAssertNil(articles)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
