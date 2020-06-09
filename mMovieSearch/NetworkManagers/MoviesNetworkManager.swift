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
    let bgQueue = DispatchQueue(label: "bg_parse_queue")
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
        case nowPlaying(page: Int? = nil)
        case upcoming(page: Int? = nil)
        case popular(page: Int? = nil)
        case topRated(page: Int? = nil)
    }
}

extension MoviesNetworkManager.APICall: EndPointType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://api.themoviedb.org/3/movie") else { fatalError("Incorrect URL") }
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
            var parameters: [String: Any] = ["api_key": APIKeys.movies.rawValue]
            if let page = page {
                parameters["page"] = page
            }
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: parameters)
        case .upcoming(let page):
            var parameters: [String: Any] = ["api_key": APIKeys.movies.rawValue]
            if let page = page {
                parameters["page"] = page
            }
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: parameters)
        case .popular(let page):
            var parameters: [String: Any] = ["api_key": APIKeys.movies.rawValue]
            if let page = page {
                parameters["page"] = page
            }
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: parameters)
        case .topRated(let page):
            var parameters: [String: Any] = ["api_key": APIKeys.movies.rawValue]
            if let page = page {
                parameters["page"] = page
            }
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: parameters)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
