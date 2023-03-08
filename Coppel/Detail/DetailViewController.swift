//
//  DetailViewController.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit
import Kingfisher

protocol DetailView: AnyObject {
    
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var adult: UILabel!
    @IBOutlet weak var vote_average: UILabel!
    @IBOutlet weak var descriptioon: UILabel!
    @IBOutlet weak var original_language: UILabel!
    
    var presenter: DetailPresenter?
    var detail: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if detail?.title != nil {
            titlee.text = "Titulo: \(detail?.title ?? "")"
        } else if detail?.name != nil {
            titlee.text = "Titulo: \(detail?.name ?? "")"
        }
        
        if detail?.release_date != nil {
            date.text = "Fecha: \(detail?.release_date ?? "")"
        } else if detail?.first_air_date != nil {
            date.text = "Fecha: \(detail?.first_air_date ?? "")"
        }
        
        var adul = "Si"
        if detail?.adult != true {
            adul = "No"
        }
        
        adult.text = "Adulto: \(adul)"
        descriptioon.text = "Descripción: \n\(detail?.overview ?? "")"
        original_language.text = "Idioma: \(detail?.original_language ?? "")"
        
        guard let popularit = detail?.popularity else { return }
        popularity.text = "Popularidad: \(popularit)"
        
        guard let average = detail?.vote_average else { return }
        vote_average.text = "Promedio: \(average)"

        image.kf.indicatorType = .activity
        image.kf.setImage(with: URL(string:"\(Network.image)\(detail?.poster_path ?? "")"), placeholder: nil, options: [.transition(.fade(1.7))],completionHandler: nil)
    }
}

extension DetailViewController: DetailView {
    
}
