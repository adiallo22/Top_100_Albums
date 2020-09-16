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
    
    let badEndpoint = "https://rss.itunes..com/api/v1/us/apple-music/top-/all/100/abcd.json"
    let goodEndpoint = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"

    override class func setUp() {
        super.setUp()
    }
    
    func testGivenBadURL_ShouldReturn_URLFailed() throws {
        let exceptation = XCTestExpectation.init(description: "Network should fail with a bad url type")
        NetworkService.shared.getTopHundredAlbums(withEndpoint: badEndpoint) { result in
            switch result {
            case .success(_):
                print("")
            case .failure(let error):
                XCTAssertNotNil(error)
                exceptation.fulfill()
            }
        }
        wait(for: [exceptation], timeout: 10.0)
    }

    
    func testGivenRightURL_ShouldReturn_Albums() {
        let exceptation = XCTestExpectation.init(description: "Network return full 100 albums")
        NetworkService.shared.getTopHundredAlbums(withEndpoint: goodEndpoint) { result in
            switch result {
            case .success(let albums):
                XCTAssertEqual(albums.count, 100)
                XCTAssertNotNil(albums)
                exceptation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        wait(for: [exceptation], timeout: 10.0)
    }
    
    func testDownloadImage_MustReturnNoImage() {
        guard let badURL = URL.init(string: badEndpoint) else { return }
        NetworkService.shared.downloadImage(withURL: badURL) { image in
            XCTAssertNil(image)
        }
    }
    
    func testDownloadImage_MustReturnImage() {
        guard let URL = URL.init(string: "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/6b/16/05/6b16053c-e27c-98e2-199c-976303f7ed8a/075679803160.jpg/200x200bb.png") else { return }
        NetworkService.shared.downloadImage(withURL: URL) { image in
            XCTAssertNotNil(image)
        }
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

}
