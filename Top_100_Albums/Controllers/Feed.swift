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
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Top 100 Albums"
        configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
        tableView.rowHeight = 250
        tableView.separatorStyle = .none
        tableView.register(AlbumCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    fileprivate func pushDetailsController(atIndex index: IndexPath) {
        let detailsvc = DetailsVC()
        detailsvc.album = albums[index.row]
        navigationController?.pushViewController(detailsvc, animated: true)
    }
    
}

//MARK: - delegate and data source

extension Feed : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushDetailsController(atIndex: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AlbumCell
        cell.album = albums[indexPath.row]
        return cell
    }
    
}

//MARK: - API

extension Feed {
    
    fileprivate func getTopHundredAlbum() {
        NetworkService.shared.getTopHundredAlbums(withEndpoint: endpoint) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let albums):
                self.albums = albums
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
