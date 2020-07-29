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
    
    private let test = ["x", "x", "x"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configTableView()
    }
    
}

//MARK: - helpers

extension Feed {
    
    func configTableView() {
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
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AlbumCell
        cell.textLabel?.text = test[indexPath.row]
        return cell
    }
    
    
}
