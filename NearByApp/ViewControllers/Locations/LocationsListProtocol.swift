//
//  ArticalesListProtocol.swift
//  TechAssesment
//
//  Created by Kareem on 6/14/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation

protocol LocationsListProtocol: class {
    func startLoading()
    func finishLoading()
    func getLocationsArray(locationsArray : [Venue])
    func fail(code:Int)
}
protocol LocationsImagesProtocol: class {
    func getLocationPhotos(locationsArray : [Items])
    func fail(code:Int)
}

protocol makeAlert : class {
    func errorAlert(errorMsg:String)
}

