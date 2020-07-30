//
//  AlbumViewModel.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/29/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    
    private let album : Album
    
    var name : String {
        return album.name
    }
    
    var artist : String {
        return album.artist
    }
    
    var thumbnail : URL? {
        if let url = URL.init(string: album.thumbnail) {
            return url
        } else {
            return nil
        }
    }
    
    init(album: Album) {
        self.album = album
    }
    
}
