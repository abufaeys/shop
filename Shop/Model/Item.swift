//
//  Item.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import Foundation


struct Item: Codable, Hashable ,Identifiable {
    
   
    
    let  price, name, uid: String
    let createdAt : String?
        let imageIDS: [String]?
        let imageUrls, imageUrlsThumbnails: [String]?

    var id: String {return uid}

        enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case price, name, uid
            case imageIDS = "image_ids"
            case imageUrls = "image_urls"
            case imageUrlsThumbnails = "image_urls_thumbnails"
        }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        uid = try values.decode(String.self, forKey: .uid)
       name = try values.decode(String.self, forKey: .name)
        price = try values.decode(String.self, forKey: .price)
        let dateString:String = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        createdAt = dateString.count > 10 ? String(dateString.prefix(10)) : ""
         

        imageIDS = try values.decodeIfPresent(Array.self, forKey: .imageIDS)
        imageUrls = try values.decodeIfPresent(Array.self, forKey: .imageUrls)
        imageUrlsThumbnails = try values.decodeIfPresent(Array.self, forKey: .imageUrlsThumbnails)

    }
    
    init(name: String, uid: String, price: String, createdAt: String,
         imageIDS: [String], imageUrls: [String], imageUrlsThumbnails:[String]){
        self.name = name
        self.uid = uid
        self.price = price
        self.createdAt = createdAt
        self.imageIDS = imageIDS
        self.imageUrls = imageUrls
        self.imageUrlsThumbnails = imageUrlsThumbnails
    }
}
