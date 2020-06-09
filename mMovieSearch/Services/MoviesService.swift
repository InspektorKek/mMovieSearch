//
//  MoviesService.swift
//  mMovieSearch
//
//  Created by Michael Borisov on 26.04.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Foundation
import Combine

protocol MoviesService {
    typealias Category = MoviesNetworkManager.APICall
    func loadMovies(category: Category, _ result: @escaping (Result<[Movie], Error>) -> Void)
}

struct MoviesCategoryService: MoviesService {
    private let networkManager: MoviesNetworkRepository
    // let store: Store - some store for data
    let cancelBag = CancelBag()
        
    init(networkManager: MoviesNetworkRepository) {
        self.networkManager = networkManager
    }
    
    func loadMovies(category: Self.Category, _ completion: @escaping (Result<[Movie], Error>) -> Void) {
        networkManager
            .loadMovies(endpoint: category)
            .sinkToResult { result in
                switch result {
                case .success(let data):
                    completion(.success(data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            .store(in: cancelBag)
    }
}
