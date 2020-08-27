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
    
    var vm : AlbumViewModel!

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
    
    func testViewModel_Returning_Propreties() {
        XCTAssert(vm.artist == "adele")
        XCTAssert(vm.name == "hello")
        XCTAssert(vm.copyright == "adele copyright")
        XCTAssert(vm.genre == "pop")
        XCTAssert(vm.releaseDate == "2014")
        XCTAssert("\(vm.thumbnail!)" == "image")
        XCTAssert(vm.url == "url")
    }

    override func tearDownWithError() throws {
        vm = nil
    }

}
