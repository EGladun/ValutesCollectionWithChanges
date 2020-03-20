//
//  Parser.swift
//  ValuteCollection
//
//  Created by Egor on 19.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Parser {
    
    var arrayOfMoney: [Valute] = []
    
    func doRequest(completion: @escaping () -> Void){
        //запрос
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").validate().responseObject { (response: DataResponse<TakenJson>) in
            switch response.result {
            case .success(let value):
                let takenJson = TakenJson()
                takenJson.bpi = value.bpi
                takenJson.disclaimer = value.disclaimer
                takenJson.chartName = value.chartName
                takenJson.time = value.time
                takenJson.bpi?.forEach({ (arg0) in
                    let (_, value) = arg0
                    self.arrayOfMoney.append(Valute(code: value.code ?? "Nothing", rate: value.rate ?? "Nothing"))
                })
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
