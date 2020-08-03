//
//  FeedTest.swift
//  Top_100_AlbumsTests
//
//  Created by Abdul Diallo on 8/2/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import XCTest
@testable import Top_100_Albums

class FeedTest: XCTestCase {
    
    var feed : Feed!

    override func setUpWithError() throws {
        feed = Feed()
        feed.loadViewIfNeeded()
    }
    
    func testTableView_Result() {
        
    }

    override func tearDownWithError() throws {
        feed = nil
    }

}
