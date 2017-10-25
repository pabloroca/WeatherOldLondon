//
//  ForeCastServiceMockedLocal.swift
//  WeatherLondon
//
//  Created by Pablo Roca Rozas on 26/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation

struct ForeCastServiceMockedLocal: ForeCastService {
    
    func getForeCast(completion: @escaping (Bool, PR2HTTPCode, [String: Any]) -> Void) {
        let jsonData = PR2Common().readJSONFileAsDict(file: "5dayforecast")
        completion(true, PR2HTTPCode.c200OK, jsonData)
    }

}
