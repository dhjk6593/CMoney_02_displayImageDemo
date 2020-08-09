//
//  ShowLargePhotoViewControllerViewModel.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/9.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit


class ShowLargePhotoViewControllerViewModel {
    
    var photo: Photo? {
        didSet{
            print("photo: \(photo)")
            onRequestEnd?(photo)
            self.getImage()
        }
    }
    
    // on completion outputs
    var onRequestEnd: ((Photo?) -> Void)?
    var onImageDownloaded: ((UIImage?) -> Void)?
    
    func getImage() {
        NetworkManager().downloadImage(url: photo?.url ?? "") { (data) in
            self.onImageDownloaded?(UIImage(data: data))
        }
    }
}
