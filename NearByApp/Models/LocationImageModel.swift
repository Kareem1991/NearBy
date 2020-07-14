//
//  LocationImageModel.swift
//  NearByApp
//
//  Created by Kareem on 7/13/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationImageModel : Mappable {
   
    var response : Photos?
    required init?(map: Map) {
    }

    func mapping(map: Map) {
        response  <- map["response"]
    }
}
class Photos: Mappable {
   
    var photos: Photo?
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        photos  <- map["photos"]
    }
}


class Photo: Mappable {
   
    var items : [Items]?
    var count: Int?
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        count  <- map["count"]
        items  <- map["items"]
    }
}

class Items: Mappable {
   
    var suffix: String?
    var height : Int?
    var width :Int?
    var prefix : String?
    var source : Source?
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        suffix  <- map["suffix"]
        prefix  <- map["prefix"]
        height  <- map["height"]
        width  <- map["width"]
    }
}

class Source: Mappable {
   
    var name: String?
    var url : String?
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        name  <- map["name"]
        url  <- map["url"]
    }
}

