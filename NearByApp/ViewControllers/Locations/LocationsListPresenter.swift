//
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import UIKit

class LocationsListPresenter {
    
    //MARK:- Variables
    weak fileprivate var locationsListProtocol: LocationsListProtocol?
    weak fileprivate var locationsImagesProtocol: LocationsImagesProtocol?
    var listOfLocations : [Venue]?
    var locationImages : [Items]?
    //MARK:- Methods
    func attachView(_ attach: Bool, view: LocationsListProtocol?) {
        if attach {
            locationsListProtocol = nil
        } else {
            if let view = view { locationsListProtocol = view }
        }
    }
    func attachedView(_ attach: Bool, view: LocationsImagesProtocol?) {
        if attach {
            locationsImagesProtocol = nil
        } else {
            if let view = view { locationsImagesProtocol = view }
        }
    }

    //MARK:- GetLocationsList
    func getLocationsList(lat: Double , lng: Double){
        self.locationsListProtocol?.startLoading()
        WebServiceFactory().GetLocationsByLatAndLng(lat: lat , lng: lng) { [weak self] (error, result, code) in
            self?.locationsListProtocol?.finishLoading()
            if code == 200 {
                if let result  = result as? LocationsModel {
                    self?.listOfLocations = result.response?.venues
                    self?.locationsListProtocol?.getLocationsArray(locationsArray: self?.listOfLocations ?? [])
                } else {
                    print("no data found")
                    self?.locationsListProtocol?.fail(code: code)
                }
            } else {
                print("Something went wrong")
                self?.locationsListProtocol?.fail(code: code)
            }
        }
    }
     //MARK:- GetImagesByVenueId
    func getImageByVenueId(venueId:String) {
        WebServiceFactory().GetImageByVenueId(venueId: venueId) { [weak self] (error , result , code) in
            if code == 200 {
                if let result  = result as? LocationImageModel {
                    self?.locationImages = result.response?.photos?.items
                    self?.locationsImagesProtocol?.getLocationPhotos(locationsArray: self?.locationImages ?? [])
                } else {
                    print("no data found")
                    
                }
            } else {
                print("Something went wrong")
                 self?.locationsImagesProtocol?.fail(code: code)
            }
        }
    }
}
