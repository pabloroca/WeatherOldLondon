//
//  ForeCastService.swift
//  WeatherLondon
//
//  Created by Pablo Roca Rozas on 26/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation

public protocol ForeCastService {
    
    func getForeCast(completion: @escaping (Bool, PR2HTTPCode, [String: Any]) -> Void)

}
