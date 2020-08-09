//
//  Photos.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import Foundation

/// API 回傳參數
struct Photo: Decodable {
    let albumId : Int?
    let id : Int?
    let title : String?
    let url : String?
    let thumbnailUrl : String?
    
    enum CodingKeys: String, CodingKey {
        
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        albumId = try values.decodeIfPresent(Int.self, forKey: .albumId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
    }
}
