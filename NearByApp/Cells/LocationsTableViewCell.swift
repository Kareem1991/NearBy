//
//  articaleTableViewCell.swift
//  TechAssesment
//
//  Created by Kareem on 6/14/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import UIKit
import Kingfisher

class locationsTableViewCell: UITableViewCell {
    
    //MARK:- @IBOutlet
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var locationAddressLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    //MARK:-  Variables
    fileprivate let locationsListPresenter = LocationsListPresenter()
    weak var delegate: makeAlert?
    var  locationImagesArray : [Items]?
    var counter = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    //MARK:- Methods
    func setupCell(location:Venue) {
        self.locationsListPresenter.attachedView(false, view: self)
        self.locationsListPresenter.getImageByVenueId(venueId: location.id ?? "")
        self.locationTitleLabel.text = location.name ?? ""
        self.locationAddressLabel.text = "\(location.location?.address ?? "") - \(location.location?.crossStreet ?? "") - \(location.location?.city ?? "")"
    }
}


//MARK: - LocationsListProtcol
extension locationsTableViewCell : LocationsImagesProtocol {
    func fail(code: Int) {
        var alert = ""
        if code == 429 {
            alert = "Images will not appear Quota exceeded"
        } else {
            alert = "Something went wrong"
        }
          counter += 1
        if counter == 1 {
           delegate?.errorAlert(errorMsg: alert)
        }else {
            //
        }
    }
    func getLocationPhotos(locationsArray: [Items]) {
        self.locationImagesArray = locationsArray
        if self.locationImagesArray?.count != 0 {
            self.locationImage.image = UIImage()
            let imageUrl = HelperMethods.generateImageUrl(suffix: self.locationImagesArray?[0].suffix ?? "" , prefix: self.locationImagesArray?[0].prefix ?? "" , height: self.locationImagesArray?[0].height ?? 0 , width: self.locationImagesArray?[0].width ?? 0)
            let url = URL(string: imageUrl)
            self.locationImage.kf.setImage(with: url)
        } else {
            // 
        }
    }
    
}


