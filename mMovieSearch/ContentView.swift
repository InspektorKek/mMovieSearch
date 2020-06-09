//
//  ContentView.swift
//  mMovieSearch
//
//  Created by Michael Borisov on 25.04.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var viewModel: MoviesListViewModel
    
    var body: some View {
        Text("Hello, World!")
    }
}
