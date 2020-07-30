//
//  AlbumViewModel.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/29/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit.UIImage

struct AlbumViewModel {
    
    private let album : Album
    
    var name : String {
        return album.name
    }
    
    var artist : String {
        return album.artist
    }
    
    var thumbnail : URL? {
        guard let url = URL.init(string: album.thumbnail) else { return nil }
        return url
    }
    
    init(album: Album) {
        self.album = album
    }
    
}
