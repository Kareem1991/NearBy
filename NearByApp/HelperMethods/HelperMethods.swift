//
//  HelperMethods.swift
//  NearByApp
//
//  Created by Kareem on 7/13/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

class  HelperMethods  {
    class func generateImageUrl(suffix:String , prefix:String , height:Int , width:Int) -> String {
        return "\(prefix)\(width*height)\(suffix)"
    }
}

extension UIViewController {
    func alertError(alertMsg:String) {
        let alert = UIAlertController(title: "Error", message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
    }

}
