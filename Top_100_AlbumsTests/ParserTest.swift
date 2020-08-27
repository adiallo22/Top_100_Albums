//
//  ParserTest.swift
//  Top_100_AlbumsTests
//
//  Created by Abdul Diallo on 8/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import XCTest
@testable import Top_100_Albums

class ParserTest: XCTestCase {
    
    var data : Data?
    
    var album1Test : Album?
    var mockAlbumtest : Album?

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        let json = """
        {
        "feed": {
            "results": [{
               "artistName": "YoungBoy Never Broke Again",
               "releaseDate": "2020-09-11",
               "name": "Top",
               "copyright": "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
               "artistUrl": "https://music.apple.com/us/artist/youngboy-never-broke-again/1168822104?app=music",
               "artworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/6b/16/05/6b16053c-e27c-98e2-199c-976303f7ed8a/075679803160.jpg/200x200bb.png",
               "genres": [
                 {
                   "name": "Hip-Hop/Rap",
                 },
                 {
                   "name": "Music",
                 }
               ],
               "url": "https://music.apple.com/us/album/top/1528592564?app=music"
             },
            {
              "artistName": "Nas",
              "releaseDate": "2020-08-21",
              "name": "King's Disease",
              "copyright": "℗ 2020 Mass Appeal",
              "contentAdvisoryRating": "Explicit",
              "artistUrl": "https://music.apple.com/us/artist/nas/35307?app=music",
              "artworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/14/4a/8f/144a8f2c-c723-2413-291b-ba2fe2819456/20UMGIM71728.rgb.jpg/200x200bb.png",
              "genres": [
                {
                  "name": "Hip-Hop/Rap",
                },
                {
                  "name": "Music",
                }
              ],
              "url": "https://music.apple.com/us/album/kings-disease/1528092359?app=music"
            }]
        }
        }
        """
        data = json.data(using: .utf8)
        album1Test = Album.init(name: "Top",
            artist: "YoungBoy Never Broke Again",
            thumbnail: "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/6b/16/05/6b16053c-e27c-98e2-199c-976303f7ed8a/075679803160.jpg/200x200bb.png",
            copyright: "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
            releaseDate: "2020-09-11",
            genre: "Hip-Hop/Rap",
            url: "https://music.apple.com/us/album/top/1528592564?app=music")
        mockAlbumtest = Album.init(name: "any",
                                   artist: "any",
                                   thumbnail: "any",
                                   copyright: "any",
                                   releaseDate: "any",
                                   genre: "any",
                                   url: "any")
    }
 
    
    func testParserFromDecoder_MustReturn_AllValuesOfAlbum() {
        guard let data = data else {
            fatalError("Data failed..")
        }
        let response = DataParser.parseData(data, andDecoder: JSONDecoder())
        if let reponse = response {
            XCTAssertEqual(reponse[0].artist, album1Test?.artist)
            XCTAssertEqual(reponse[0].thumbnail, album1Test?.thumbnail)
            XCTAssertEqual(reponse[0].copyright, album1Test?.copyright)
            XCTAssertEqual(reponse[0].genre, album1Test?.genre)
            XCTAssertEqual(reponse[0].releaseDate, album1Test?.releaseDate)
            XCTAssertEqual(reponse[0].url, album1Test?.url)
            XCTAssertEqual(reponse[0].name, album1Test?.name)
        }
    }
    
    func testParserFromDecoder_MustReturn_FalseFromMockInput() {
        guard let data = data else {
            fatalError("Data failed..")
        }
        let response = DataParser.parseData(data, andDecoder: JSONDecoder())
        if let reponse = response {
            XCTAssertNotEqual(reponse[1].artist, mockAlbumtest?.artist)
            XCTAssertNotEqual(reponse[1].thumbnail, mockAlbumtest?.thumbnail)
            XCTAssertNotEqual(reponse[1].copyright, mockAlbumtest?.copyright)
            XCTAssertNotEqual(reponse[1].genre, mockAlbumtest?.genre)
            XCTAssertNotEqual(reponse[1].releaseDate, mockAlbumtest?.releaseDate)
            XCTAssertNotEqual(reponse[1].url, mockAlbumtest?.url)
            XCTAssertNotEqual(reponse[1].name, mockAlbumtest?.name)
        }
    }

    override func tearDownWithError() throws {
        super.tearDown()
        data = nil
        album1Test = nil
        mockAlbumtest = nil
    }

}
