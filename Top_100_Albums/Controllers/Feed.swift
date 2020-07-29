//
//  Feed.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/29/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

private let cellIdentifier = "albumCell"

class Feed : UIViewController {
    
    private let tableView = UITableView()
    
    private let endpoint = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
    
    private var albums : [Album] = [] {
        didSet {
            print("albums data received.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configTableView()
        getTopHundredAlbum()
    }
    
}

//MARK: - helpers

extension Feed {
    
    fileprivate func configTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
}

//MARK: - delegate and data source

extension Feed : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected.")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AlbumCell
        return cell
    }
    
}

//MARK: - API

extension Feed {
    
    fileprivate func getTopHundredAlbum() {
        NetworkService.shared.getTopHundredAlbums(withEndpoint: endpoint) { result in
            print("")
        }
    }
    
}
