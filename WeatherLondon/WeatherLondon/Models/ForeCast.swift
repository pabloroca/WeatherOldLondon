//
//  ForeCast.swift
//  WeatherLondon
//
//  Created by Pablo Roca Rozas on 25/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation

struct ForeCast: Loopable {
    var code: Int
    var list: [ForeCastItem]
    
    init(code: Int, list: [ForeCastItem]) {
        self.code = code
        self.list = list
    }
    
    init(json: [String : Any]) {
        let code = json["code"] as? Int ?? 0
        
        let listJSON = json["list"] as? [[String:Any]] ?? []
        let listArray = listJSON.map { ForeCastItem(json: $0) }
        
        self.init(code: code, list: listArray)
    }
    
}
