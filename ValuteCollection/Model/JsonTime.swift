//
//  JsonTime.swift
//  Parser
//
//  Created by Egor on 11.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import ObjectMapper

class JsonTime: Mappable{
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        updated <- map["updated"]
        updatedISO <- map["updatedISO"]
        updateduk <- map["updateduk"]
    }
    
    var updated: String?
    var updatedISO: String?
    var updateduk: String?
}
