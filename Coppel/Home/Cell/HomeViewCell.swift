//
//  HomeViewCell.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit
import Kingfisher

class HomeViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descriptioon: UILabel!
    @IBOutlet weak var vote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        image.layer.cornerRadius = 15
        title.numberOfLines = 0
    }

    func setupUI(data: Movie) {
        descriptioon.text = data.overview
        vote.text = data.vote_average?.description ?? ""
        if data.title != nil {
            title.text = data.title
        } else if data.name != nil {
            title.text = data.name
        }
        
        if data.release_date != nil {
            date.text = data.release_date
        } else if data.first_air_date != nil {
            date.text = data.first_air_date
        }
        
        image.kf.indicatorType = .activity
        image.kf.setImage(with: URL(string:"https://image.tmdb.org/t/p/w200\(data.poster_path ?? "")"), placeholder: nil, options: [.transition(.fade(1.7))],completionHandler: nil)
    }
}
