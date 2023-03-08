//
//  ProfileViewController.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol ProfileView: AnyObject {
    func upDateProfile(user: User)
    func error(error: String)
    func favorite(favorite: Favorite)
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var user: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let reuseIdentifier = "Cell"
    
    var presenter: ProfilePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
//        presenter?.profile()
        presenter?.favorite()
        setupUI()
    }
    
    func setupUI() {
        image.layer.cornerRadius = image.frame.height/2
    }
}

extension ProfileViewController: ProfileView {
    
    func favorite(favorite: Favorite) {
        
    }
    
    func upDateProfile(user: User) {
        DispatchQueue.main.async {
            self.user.text = user.user
        }
    }
    
    func error(error: String) {
        print(error)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeViewCell
//        cell.setupUI(data: movies[indexPath.row])
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 350)
    }
}
