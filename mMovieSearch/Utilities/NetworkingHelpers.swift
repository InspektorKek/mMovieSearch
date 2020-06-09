//
//  NetworkingHelpers.swift
//  mMovieSearch
//
//  Created by Michael Borisov on 04.05.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Combine
import Foundation

extension Publisher {
    func sinkToResult(_ result: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
        return sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                result(.failure(error))
            default: break
            }
        }, receiveValue: { value in
            result(.success(value))
        })
    }
}
