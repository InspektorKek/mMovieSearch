//
//  MoviesListViewModel.swift
//  mMovieSearch
//
//  Created by Michael Borisov on 11.05.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Foundation

class MoviesListViewModel: ObservableObject {
    private let servise: MoviesCategoryService
    
    init(servise: MoviesCategoryService) {
        self.servise = servise
        servise.loadMovies(category: .nowPlaying()) { result in
            
        }
    }
}
