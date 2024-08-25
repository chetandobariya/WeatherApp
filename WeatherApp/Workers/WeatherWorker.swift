//
//  WeatherWorker.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation

protocol WeatherWorkerInterface {
    func getCurrentWeather<T: Decodable>(lat: Double, lon: Double, excluded: String, _ completion: @escaping (NetworkRequestDecodable<T>) -> Void)
    func getCity<T: Decodable>(lat: Double, lon: Double, _ completion: @escaping (NetworkRequestDecodable<T>) -> Void)
}

class WeatherWorker: WeatherWorkerInterface {
    
    static var shared: WeatherWorkerInterface = { WeatherWorker() }()
    var backend = BackendAdapter.shared
  
    // MARK: - Backend calls
    func getCurrentWeather<T: Decodable>(lat: Double, lon: Double, excluded: String, _ completion: @escaping (NetworkRequestDecodable<T>) -> Void) {
        let endpoint = Endpoint(api: .getCurrentWeather(lat, lon, excluded))
        self.backend.genericFetch(endpoint: endpoint) { result in
            completion(result)
        }
    }
    
    func getCity<T: Decodable>(lat: Double, lon: Double, _ completion: @escaping (NetworkRequestDecodable<T>) -> Void) {
        let endpoint = Endpoint(api: .getCityName(lat, lon))
        self.backend.genericFetch(endpoint: endpoint) { result in
            completion(result)
        }
    }
    
}
