//
//  PhotoCollectionViewCell.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell{
    
    //MARK: - UI
    var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Attribute
    private var viewModel: PhotoCollectionViewCellViewModel?
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageV)
        self.addSubview(idLabel)
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageV.image = nil
        self.viewModel?.onImageDownloaded = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageV.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imageV.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageV.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        imageV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        idLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        idLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        idLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        idLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
    }
    
    //MARK: - Operation
    func setup(viewModel: PhotoCollectionViewCellViewModel) {
        self.viewModel = viewModel
        
        self.idLabel.text = viewModel.photoId
        self.titleLabel.text = viewModel.photoTitle
        
        self.viewModel?.onImageDownloaded = { [weak self] image in
            DispatchQueue.main.async {
                self?.imageV.image = image
            }
        }
        self.viewModel?.getImage()
    }
}
