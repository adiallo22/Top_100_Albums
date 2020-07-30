//
//  DetailsVC.swift
//  Top_100_Albums
//
//  Created by Abdul Diallo on 7/30/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class DetailsVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        guard let feed = navigationController?.presentingViewController as? Feed else { return }
        feed.delegate = self
    }
    
}

//MARK: - AlbumDetailsDelegate

extension DetailsVC : AlbumDetailsDelegate {
    
    func accessAlbumDetails(_ album: Album) {
        print(album )
    }

}
