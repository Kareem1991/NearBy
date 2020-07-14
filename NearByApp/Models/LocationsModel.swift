
//
//  articlesListModel.swift
//  TechAssesment
//
//  Created by Kareem on 6/14/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationsModel : Mappable {
   
    var response : Venues?
    required init?(map: Map) {
    }

    func mapping(map: Map) {
        response  <- map["response"]
    }
}
class Venues: Mappable {
   
    var venues: [Venue]?
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        venues  <- map["venues"]
    }
}
class Venue: Mappable {
   
    var id: String?
    var name :String?
    var location : Location?
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        id  <- map["id"]
        name  <- map["name"]
        location  <- map["location"]
    }
}


class Location: Mappable {
   
    var address: String?
    var crossStreet :String?
    var city : String?
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        address  <- map["address"]
        crossStreet  <- map["crossStreet"]
        city  <- map["city"]
    }
}

