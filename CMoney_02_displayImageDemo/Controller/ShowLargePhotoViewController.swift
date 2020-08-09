//
//  ShowLargePhotoViewController.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/9.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

class ShowLargePhotoViewController: UIViewController {
    
    var photo: Photo?
    let viewModel = ShowLargePhotoViewControllerViewModel()
    
    let largePhotoImageV :UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    func bindViewModel() {
        viewModel.onRequestEnd = {[weak self] photo in
            guard let id = photo?.id, let title = photo?.title else{return}
            
            self?.idLabel.text = "id: \(id)"
            self?.titleLabel.text = "title: \(title)"
        }
        
        viewModel.onImageDownloaded = { [weak self] image in
            DispatchQueue.main.async {
                self?.largePhotoImageV.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(largePhotoImageV)
        self.view.addSubview(idLabel)
        self.view.addSubview(titleLabel)
        
        largePhotoImageV.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        largePhotoImageV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        largePhotoImageV.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        largePhotoImageV.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        idLabel.topAnchor.constraint(equalTo: self.largePhotoImageV.bottomAnchor, constant: 20).isActive = true
        idLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        idLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: self.idLabel.bottomAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        
        self.bindViewModel()
        viewModel.photo = self.photo
    }
}
