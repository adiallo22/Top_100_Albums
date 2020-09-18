//
//  FeedTest.swift
//  Top_100_AlbumsTests
//
//  Created by Abdul Diallo on 9/17/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import XCTest
@testable import Top_100_Albums

class FeedTest : XCTestCase {
    
    var sut : Feed!
    
    override func setUp() {
        super.setUp()
        sut = makeSUT()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testTableView_NOfRow_NOfSection() {
        sut.albums.append(Album.init(name: "test", artist: "test",
                                     thumbnail: "test", copyright: "test",
                                     releaseDate: "test", genre: "test",
                                     url: "test"))
        let cell = sut.tableView.cellForRow(at: IndexPath.init(item: 0, section: 0)) as? AlbumCell
        XCTAssertEqual(sut.tableView.numberOfSections, 1, "number of section should be 1")
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1, "number of rows in section 1 should be 1")
        XCTAssertEqual(cell?.album?.artist, "test", "name of artist of first album should be test")
    }
    
    func makeSUT() -> Feed {
        let sut = Feed()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
