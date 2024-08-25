//
//  BackendAdapterMock.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

@testable import WeatherApp
import Foundation

class BackendAdapterMock: Backend {
    var endpointCalled: API?
  
    func genericFetch<T: Decodable>(endpoint: Endpoint,
                                    completion: @escaping (_ model: NetworkRequestDecodable<T>) -> Void) {
        self.endpointCalled = endpoint.api

        switch endpoint.api {
        case .getCityName:
            do {
                let jsonData = getCityDataDictionary()
                let model = try JSONDecoder().decode(T.self, from: jsonData)
                completion(.success(model))
            } catch let jsonError {
                completion(.failure(error: jsonError))
            }
        case .getCurrentWeather:
            do {
                let jsonData = getCurrentWeatherDataDictionary()
                let model = try JSONDecoder().decode(T.self, from: jsonData)
                completion(.success(model))
            } catch let jsonError {
                completion(.failure(error: jsonError))
            }
        }
    }
    
}
