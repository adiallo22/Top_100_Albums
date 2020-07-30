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
    
    var album : Album? {
        didSet {
            configAlbum()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
    }
    
}


//MARK: - helpers

extension DetailsVC {
    
    fileprivate func configUI() {
        view.addSubview(thumbnail)
        thumbnail.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: padding, paddingLeft: padding, paddingRight: padding)
        thumbnail.heightAnchor.constraint(equalToConstant: 300).isActive = true
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
        viewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        viewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                            constant: padding).isActive = true
    }
    
    fileprivate func configAlbum() {
        guard let album = album else { return }
        let viewModel = AlbumViewModel.init(album: album)
        name.text = "🎵 \(viewModel.name) by \(viewModel.artist)"
        copyright.text = "\(viewModel.copyright)  ●  \(viewModel.releaseDate)"
        genre.text = "🎧 \(viewModel.genre)"
        DispatchQueue.global(qos: .background).async {
            guard let url = viewModel.thumbnail else { return }
            guard let data = try? Data.init(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.thumbnail.image = UIImage.init(data: data)
            }
        }
    }
    
}


//MARK: - selectors

extension DetailsVC {
    
    @objc func openItunesTapped() {
        guard let album = album else { return }
        guard let url = URL.init(string: album.url) else { return }
        UIApplication.shared.open(url, options: .init(), completionHandler: nil)
    }
    
}
