//
//  AlbumViewModelTest.swift
//  Top_100_AlbumsTests
//
//  Created by Abdul Diallo on 8/2/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import XCTest
@testable import Top_100_Albums

class AlbumViewModelTest: XCTestCase {
    
    var vm : AlbumViewModel?

    override func setUpWithError() throws {
        let album = Album.init(name: "hello",
                               artist: "adele",
                               thumbnail: "image",
                               copyright: "adele copyright",
                               releaseDate: "2014",
                               genre: "pop",
                               url: "url")
        vm = AlbumViewModel(album: album)
    }
    
    func testViewModel_Returning_RightPropreties() {
        if let vm = vm {
            XCTAssertEqual(vm.artist, "adele")
            XCTAssertEqual(vm.name, "hello")
            XCTAssertEqual(vm.copyright, "adele copyright")
            XCTAssertEqual(vm.genre, "pop")
            XCTAssertEqual(vm.releaseDate, "2014")
            XCTAssertEqual(vm.url, "url")
            XCTAssertEqual(vm.thumbnail, URL(string: "image"))
        }
    }

    override func tearDownWithError() throws {
        vm = nil
    }

}
