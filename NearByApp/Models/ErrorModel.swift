//
//  ErrorModel.swift
//  TechAssesment
//
//  Created by Kareem on 6/14/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation

class ErrorModel {
    var eCode: Int!
    var eMsg: String!
    
    init(eCode: Int, eMsg: String) {
        self.eCode = eCode
        self.eMsg = eMsg
    }
}
