//
//  MoviesService.swift
//  mMovieSearch
//
//  Created by Michael Borisov on 26.04.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

protocol MoviesService {
    typealias Category = MoviesNetworkManager.APICall
    func loadMovies(category: Category)
}

struct MoviesCategoryService: MoviesService {
    let networkManager: MoviesNetworkRepository
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(networkManager: MoviesNetworkRepository) {
        self.networkManager = networkManager
    }
    
    func loadMovies(category: Self.Category) {
        
    }
}
