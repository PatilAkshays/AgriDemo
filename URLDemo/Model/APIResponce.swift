//
//  APIResponce.swift
//  URLDemo
//
//  Created by Manish Ingale on 30/08/21.
//

import Foundation
import ObjectMapper

struct ValidationResult {
    var success: Bool = false
    var errorMessage: String?
}

class AgriModel: Mappable {
    
    var id: Int?
    var title: String?
    var price: Float?
    var description: String?
    var category: String?
    var image: String?
    var rating: [RatingModel] = []
   
    required init?(map: Map) {
        
    }
    required public init?(){}
    
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        price <- map["price"]
        description <- map["description"]
        category <- map["category"]
        image <- map["image"]
        rating <- map["rating"]
        
    }
}

class RatingModel: Mappable {
    
    var rate: Float?
    var count: Float?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        rate <- map["rate"]
        count <- map["count"]
    }
}
