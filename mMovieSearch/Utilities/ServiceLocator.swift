//
//  ServiceLocator.swift
//  mMovieSearch
//
//  Created by Michael Borisov on 09.06.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Foundation

class ServiceLocator {
    private var registry : [String: Any] = [:]
    
    func registerService<T>(service: T) {
        let key = "\(T.self)"
        registry[key] = service
    }
    
    func tryGetService<T>() -> T? {
        let key = "\(T.self)"
        return registry[key] as? T
    }
    
    func getService<T>() -> T {
        let key = "\(T.self)"
        return registry[key] as! T
    }
}
