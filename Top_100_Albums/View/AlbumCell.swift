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
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var thumbnail : UIImageView = {
        let imgV = UIImageView()
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
        thumbnail.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingTop: 5,
                         paddingLeft: 5,
                         paddingBottom: 5,
                         paddingRight: 5)
        addSubview(name)
        name.anchor(left: leftAnchor,
                    bottom: bottomAnchor,
                    right: rightAnchor,
                    paddingLeft: 16,
                    paddingBottom: 16,
                    paddingRight: 16)
    }
    
    fileprivate func configAlbum() {
        guard let album = album else { return }
        let viewModel = AlbumViewModel.init(album: album)
        name.text = viewModel.nameAndArtist
        guard let url = viewModel.thumbnail else { return }
        NetworkService.shared.downloadImage(withURL: url) { [weak self] result in
            switch result {
            case .success(let image):
                self?.thumbnail.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
