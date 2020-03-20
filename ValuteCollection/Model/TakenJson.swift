//
//  TakenJson.swift
//  ValuteCollection
//
//  Created by Egor on 19.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import ObjectMapper

class TakenJson: Mappable{
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        time <- map["time"]
        disclaimer <- map["disclaimer"]
        chartName <- map["chartname"]
        bpi <- map["bpi"]
    }
    
    var time: JsonTime?
    var disclaimer: String? = ""
    var chartName: String? = ""
    var bpi: [String: Bpi]? = [:]
}
