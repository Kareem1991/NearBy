//
//  WebServiceFactory.swift
//  TechAssesment
//
//  Created by Kareem on 6/14/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import ObjectMapper

class WebServiceFactory {
    
    //MARK:- GetLocByLatAndLng
    func GetLocationsByLatAndLng(lat:Double , lng:Double ,
                                 completionHandler: @escaping (
        _ error: ErrorModel?,
        _ jsonData: Mappable? ,
        _ statusCode:Int) -> ()) {
        NetworkManager().createHTTPRequest(
            url: API.baseURL.rawValue + "venues/search?ll=\(lat),\(lng)&client_id=\(authIds.clientId.rawValue)&client_secret=\(authIds.clientSecret.rawValue)&v=20200713" ,
            params: [:] ,
            method: .post, headers: [:]) { (response , code)  in
                let locationsModel = Mapper<LocationsModel>().map(JSONObject: response.result.value)
                
                completionHandler(nil,locationsModel , response.response?.statusCode ?? 0)
        }
    }
    
    //MARK:- GetImageByVenueId
    func GetImageByVenueId(venueId:String ,
                           completionHandler: @escaping (
        _ error: ErrorModel?,
        _ jsonData: Mappable? ,
        _ statusCode:Int) -> ()) {
        NetworkManager().createHTTPRequest(
            url: API.baseURL.rawValue + "venues/\(venueId)/photos?client_secret=\(authIds.clientSecret.rawValue)&client_id=\(authIds.clientId.rawValue)&v=20200713"  ,
            params: [:] ,
            method: .get, headers: [:]) { (response , code)  in
                let locationImagesModel = Mapper<LocationImageModel>().map(JSONObject: response.result.value)
                
                completionHandler(nil,locationImagesModel , response.response?.statusCode ?? 0)
        }
    }
    
}
