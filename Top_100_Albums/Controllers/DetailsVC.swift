//
//  DetailsVC.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/30/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

private let padding = CGFloat(20)

class DetailsVC : UIViewController {
    
    private var thumbnail : UIImageView = {
        let imgV = UIImageView()
        imgV.layer.cornerRadius = 15
        imgV.layer.masksToBounds = true
        return imgV
    }()
    
    private var viewButton : UIButton = {
        let button = UIButton()
        button.setTitle("Open on ITunes", for: .normal)
        button.addTarget(self, action: #selector(openItunesTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private var name : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private var copyright : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private var genre : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var album : Album
    
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configAlbum()
        configUI()
    }
    
}


//MARK: - helpers

extension DetailsVC {
    
    fileprivate func configUI() {
        view.backgroundColor = .white
        view.addSubview(thumbnail)
        thumbnail.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: padding, paddingLeft: padding, paddingRight: padding)
        thumbnail.dimension(height: 300)
        //
        let stack : UIStackView = {
            let stack = UIStackView(arrangedSubviews: [name, genre, copyright])
            stack.axis = .vertical
            stack.spacing = 15
            stack.isLayoutMarginsRelativeArrangement = true
            stack.layoutMargins = .init(top: padding, left: padding, bottom: padding, right: padding)
            return stack
        }()
        view.addSubview(stack)
        stack.anchor(top: thumbnail.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        //
        view.addSubview(viewButton)
        viewButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: padding)
        viewButton.centerX(inView: view)
        viewButton.dimension(height: 50)
        viewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                            constant: padding).isActive = true
    }
    
    fileprivate func configAlbum() {
        let viewModel = AlbumViewModel.init(album: album)
        name.text = "🎵 \(viewModel.name) by \(viewModel.artist)"
        copyright.text = "\(viewModel.copyright)  ●  \(viewModel.releaseDate)"
        genre.text = "🎧 \(viewModel.genre)"
        if let url = viewModel.thumbnail {
            NetworkService.shared.downloadImage(withURL: url) { [weak self] image in
                self?.thumbnail.image = image
            }
        }
    }
    
}


//MARK: - selectors

extension DetailsVC {
    
    @objc func openItunesTapped() {
        guard let url = URL.init(string: album.url) else { return }
        UIApplication.shared.open(url, options: .init(), completionHandler: nil)
    }
    
}
