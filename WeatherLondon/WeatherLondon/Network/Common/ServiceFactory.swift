//
//  ServiceFactory.swift
//  SkyScannerFlights
//
//  Created by Pablo Roca Rozas on 18/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation

struct ServiceFactory {
    
    static func ForeCastService() -> ForeCastService {
        #if ENVMOCKEDLOCAL
            return ForeCastServiceMockedLocal()
        #else
            #if DEBUG
                if let _ = NSClassFromString("XCTest") {
                    return ForeCastServiceMockedLocal()
                }
            #endif
            return ForeCastServiceRemote()
        #endif
    }
    
}
