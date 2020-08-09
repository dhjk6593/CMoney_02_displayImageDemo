//
//  PhotosViewControllerViewModel.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import Foundation


class PhotosViewControllerViewModel {
    
    var photoCollectionViewCellViewModels: [PhotoCollectionViewCellViewModel] = []
    var photos: [Photo] = []
    
    // on completion outputs
    var onRequestEnd: (() -> Void)?
    
    func fetchApi(){
        NetworkManager().fetchPhotos { (photos) in
            self.convertPhotoToViewModel(photos: photos)
        }
    }
    
    private func convertPhotoToViewModel(photos: [Photo]) {
        self.photos = photos
        for photo in photos {
            photoCollectionViewCellViewModels.append(PhotoCollectionViewCellViewModel(photoUrl: photo.thumbnailUrl ?? "",
                                                                                      photoId: "\(photo.id ?? 0)",
                                                                                      photoTitle: photo.title ?? "no title"))
        }
        onRequestEnd?()
    }
}
