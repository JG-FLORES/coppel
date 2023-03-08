//
//  HomeViewCell.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

class HomeViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descriptioon: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        image.layer.cornerRadius = 15
    }

    func setupUI(data: Movie) {
        descriptioon.text = data.overview

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

//        guard let image = data.backdrop_path else { return }
//        DispatchQueue.main.async {
//            let url = URL(string: "https://api.themoviedb.org\(image)")!
//            let data = try? Data(contentsOf: url)
//            self.image.image = UIImage(data: data!)
//        }
    }
}
