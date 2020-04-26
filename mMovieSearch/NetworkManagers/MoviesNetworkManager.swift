//
//  MoviesNetworkManager.swift
//  mMovieSearch
//
//  Created by Michael Borisov on 26.04.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Combine
import Foundation
import NetworkLayer

protocol MoviesNetworkRepository: NetworkManager {
    func loadMovies(endpoint: EndPointType) -> AnyPublisher<MoviesResponse, Error>
}

struct MoviesNetworkManager: MoviesNetworkRepository {
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func loadMovies(endpoint: EndPointType) -> AnyPublisher<MoviesResponse, Error> {
        return request(endpoint)
    }
}

extension MoviesNetworkManager {
    enum APICall {
        case nowPlaying(page: Int)
        case upcoming(page: Int)
        case popular(page: Int)
        case topRated(page: Int)
    }
}

extension MoviesNetworkManager.APICall: EndPointType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://api.themoviedb.org/3") else { fatalError("Incorrect URL") }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "now_playing"
        case .upcoming:
            return "upcoming"
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .nowPlaying(let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["page": page,
                                                      "api_key": APIKeys.movies])
        case .upcoming(let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["page": page,
                                                      "api_key": APIKeys.movies])
        case .popular(let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["page": page,
                                                      "api_key": APIKeys.movies])
        case .topRated(let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["page": page,
                                                      "api_key": APIKeys.movies])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
