//
//  DetailsVC.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/30/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class DetailsVC : UIViewController {
    
    private var thumbnail : UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = .blue
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
        label.numberOfLines = 0
        return label
    }()
    
    private var copyright : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Copyright: "
        return label
    }()
    
    private var genre : UILabel = {
        let label = UILabel()
        label.text = "Genre: "
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
        guard let feed = navigationController?.presentingViewController as? Feed else { return }
        feed.delegate = self
    }
    
}


//MARK: - helpers

extension DetailsVC {
    
    fileprivate func configUI() {
        view.addSubview(viewButton)
        viewButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20)
        viewButton.centerX(inView: view)
        viewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //
        view.addSubview(thumbnail)
        thumbnail.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        thumbnail.heightAnchor.constraint(equalToConstant: 300).isActive = true
        //
        let stack : UIStackView = {
            let stack = UIStackView(arrangedSubviews: [name, genre, copyright])
            stack.axis = .vertical
            stack.spacing = 10
            stack.isLayoutMarginsRelativeArrangement = true
            stack.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
            return stack
        }()
        view.addSubview(stack)
        stack.anchor(top: thumbnail.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
    
}


//MARK: - AlbumDetailsDelegate

extension DetailsVC : AlbumDetailsDelegate {
    
    func accessAlbumDetails(_ album: Album) {
        print(album)
    }

}


//MARK: - selectors

extension DetailsVC {
    
    @objc func openItunesTapped() {
        print("itunes opened.")
    }
    
}
