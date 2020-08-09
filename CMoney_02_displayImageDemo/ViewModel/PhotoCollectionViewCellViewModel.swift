//
//  PhotoCollectionViewCellViewModel.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

class PhotoCollectionViewCellViewModel {
    
    var photoUrl: String
    var photoId: String
    var photoTitle: String
    
    var onImageDownloaded: ((UIImage?) -> Void)?
    
    init(photoUrl: String, photoId: String, photoTitle: String) {
        self.photoUrl = photoUrl
        self.photoId = photoId
        self.photoTitle = photoTitle
    }
    
    func getImage() {
        NetworkManager().downloadImage(url: photoUrl) { (data) in
            self.onImageDownloaded?(UIImage(data: data))
        }
    }
}
