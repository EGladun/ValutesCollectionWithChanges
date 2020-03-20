//
//  Bpi.swift
//  Parser
//
//  Created by Egor on 11.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import ObjectMapper

class Bpi: Mappable{
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        symbol <- map["symbol"]
        rate <- map["rate"]
        description <- map["description"]
        rate_float <- map["rate_float"]
    }
    
    var code: String?
    var symbol: String?
    var rate: String?
    var description: String?
    var rate_float: NSNumber?
}
