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
    
    private var name : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var thumbnail : UIImageView = {
        let imgV = UIImageView()
//        imgV.image = #imageLiteral(resourceName: "Placeholder")
        return imgV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - helpers

extension AlbumCell {
    
    fileprivate func configUI() {
        addSubview(thumbnail)
        thumbnail.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 2, paddingBottom: 5, paddingRight: 2)
        addSubview(name)
        name.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
    }
    
    fileprivate func configAlbum() {
        guard let album = album else { return }
        let viewModel = AlbumViewModel.init(album: album)
        name.text = "\(viewModel.name) by \(viewModel.artist)"
        DispatchQueue.global(qos: .background).async {
            guard let url = viewModel.thumbnail else { return }
            guard let data = try? Data.init(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.thumbnail.image = UIImage.init(data: data)
            }
        }
    }
    
}
