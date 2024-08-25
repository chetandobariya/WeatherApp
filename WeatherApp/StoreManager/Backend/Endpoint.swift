//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation

typealias JSON = [String: Any]

protocol Requestable {
    var api: API { get }
}

struct Endpoint: Requestable {
    var api: API
}

struct DownloadEndpoint: Requestable {
    var api: API
    let fileURL: URL
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum API {
    
    // MARK: - Weather API
    
    case getCurrentWeather(Double, Double, String)
    case getCityName(Double, Double)

    var method: HTTPMethod {
        switch self {
        case .getCurrentWeather, .getCityName:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCurrentWeather:
            return "/onecall"
       
        case .getCityName:
            return "/reverse"
        }
    }
    
    var url: URL {
        switch self {
            
        case .getCurrentWeather:
            
            let url = Constants.AppURL.baseUrl.appendingPathComponent(self.path)
            guard let queryItems = self.queryItems,
                  var components = URLComponents(string: url.absoluteString) else {
                return url
            }
            
            components.queryItems = queryItems
            return components.url!
            
        case .getCityName:
            
            let url = Constants.AppURL.geoURL.appendingPathComponent(self.path)
            guard let queryItems = self.queryItems,
                  var components = URLComponents(string: url.absoluteString) else {
                return url
            }
            
            components.queryItems = queryItems
            return components.url!
        }
    }
    
    var queryItems: [URLQueryItem]? {
        var queryItems: [URLQueryItem] = []

        switch self {
        case .getCurrentWeather(let lat, let lon, let excluded):
            queryItems.append(URLQueryItem(name: "lat", value: "\(lat)"))
            queryItems.append(URLQueryItem(name: "lon", value: "\(lon)"))
            queryItems.append(URLQueryItem(name: "excluded", value: excluded))
            queryItems.append(URLQueryItem(name: "units", value: "imperial"))
            queryItems.append(URLQueryItem(name: "appid", value: Constants.AppSettings.apiKey))
            
        case .getCityName(let lat, let lon):
            queryItems.append(URLQueryItem(name: "lat", value: "\(lat)"))
            queryItems.append(URLQueryItem(name: "lon", value: "\(lon)"))
            queryItems.append(URLQueryItem(name: "appid", value: Constants.AppSettings.apiKey))
            
        }
        return queryItems
    }
    
    var requestParameters: JSON? {
        switch self {
        default:
            return nil
        }
    }
    
}
