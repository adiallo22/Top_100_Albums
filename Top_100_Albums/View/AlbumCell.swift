//
//  AlbumCell.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/29/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class AlbumCell : UITableViewCell {
    
    var album : Album? {
        didSet {
            configAlbum()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - helpers

extension AlbumCell {
    
    fileprivate func configAlbum() {
        print("set album cell at..")
    }
    
}
