//
//  HomeViewController.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol HomeView: AnyObject {
    func upDatePopular(data: [Movie])
    func error(data: String)
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenter?
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "Cell"
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TV Shows"
        configure()
        collectionView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        presenter?.fetch(url: "https://api.themoviedb.org/3/movie/popular?api_key=54b4dae81703af84602fb788f06fc875&language=en-US&page=1")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(addTapped))        
    }
    
    @objc func addTapped() {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "View Profile", style: .default, handler: { (UIAlertAction) in
            self.presenter?.goToProfile()
        })
        
        let saveAction = UIAlertAction(title: "Log out", style: .destructive, handler: { (UIAlertAction) in
            self.presenter?.logOut()
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
        })

        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)
    }
    
    
    @IBAction func didChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            updeta()
            presenter?.fetch(url: "https://api.themoviedb.org/3/movie/popular?api_key=54b4dae81703af84602fb788f06fc875&language=en-US&page=1")
        } else if sender.selectedSegmentIndex == 1 {
            updeta()
            presenter?.fetch(url: "https://api.themoviedb.org/3/movie/top_rated?api_key=54b4dae81703af84602fb788f06fc875&language=en-US&page=1")
        } else if sender.selectedSegmentIndex == 2 {
            updeta()
            presenter?.fetch(url: "https://api.themoviedb.org/3/tv/on_the_air?api_key=54b4dae81703af84602fb788f06fc875&language=en-US&page=1")
        } else if sender.selectedSegmentIndex == 3 {
            updeta()
            presenter?.fetch(url: "https://api.themoviedb.org/3/tv/airing_today?api_key=54b4dae81703af84602fb788f06fc875&language=en-US&page=1")
        }
    }
    
    func updeta() {
        collectionView.reloadData()
        movies = []
    }
}

extension HomeViewController: HomeView {
    func upDatePopular(data: [Movie]) {
        DispatchQueue.main.async {
            self.movies = data
            self.collectionView.reloadData()
        }
    }
    
    func error(data: String) {
        
    }
}

extension HomeViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeViewCell
        cell.setupUI(data: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 25, bottom: 0, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.goToDetail(detail: movies[indexPath.row])
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: view.frame.width, spacing: 20)
        return CGSize(width: width, height: 350)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return finalWidth - 5.0
    }
}
