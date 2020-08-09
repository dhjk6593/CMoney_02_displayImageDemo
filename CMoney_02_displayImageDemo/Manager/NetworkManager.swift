//
//  NetworkManager.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/9.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import Foundation


final class NetworkManager {
    private let domainUrlString = "https://jsonplaceholder.typicode.com/"
    func fetchPhotos(completionHandler: @escaping ([Photo]) -> Void) {
        
        let url = URL(string: domainUrlString + "photos/")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching photos: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
            }
            
            guard let data = data,
                let photos = try? JSONDecoder().decode(Array<Photo>.self, from: data) else{
                print("data decode error")
                    return
            }
            completionHandler(photos)
        })
        task.resume()
    }
    
    func downloadImage(url: String, completionHandler: @escaping (Data) -> Void){
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            completionHandler(data)
        }
        task.resume()
    }
}
