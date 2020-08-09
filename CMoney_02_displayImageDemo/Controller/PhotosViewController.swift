//
//  PhotosViewController.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosViewController: UIViewController {
    
    let viewModel = PhotosViewControllerViewModel()
    var myCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchApi()
        self.bindViewModel()
        self.setupCollectionView()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myCollectionView?.frame = view.frame
        guard let layout = myCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout else{return}
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/4)
    }
    
    func bindViewModel() {
        
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.myCollectionView?.reloadData()
            }
        }
    }
    
    func setupCollectionView(){
        
        let view = UIView()
        view.backgroundColor = .white
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/4)
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        myCollectionView?.backgroundColor = UIColor.white
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.myCollectionView?.delegate = self
        self.myCollectionView?.dataSource = self
        
        self.view = view
    }

}

extension PhotosViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let showLargePhotoVC = ShowLargePhotoViewController()
        showLargePhotoVC.photo = viewModel.photos[indexPath.row]
        self.navigationController?.pushViewController(showLargePhotoVC, animated: true)
    }
}

extension PhotosViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photoCollectionViewCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        guard let mycell = myCell as? PhotoCollectionViewCell else{return myCell}
        mycell.setup(viewModel: viewModel.photoCollectionViewCellViewModels[indexPath.row])
        return myCell
    }
}
