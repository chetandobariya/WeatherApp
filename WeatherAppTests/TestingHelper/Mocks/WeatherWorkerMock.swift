//
//  WeatherWorkerMock.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

@testable import WeatherApp
import Foundation

class WeatherWorkerMock: WeatherWorkerInterface {
    var getCurrentWeatherCalled = false
    func getCurrentWeather<T: Decodable>(lat: Double, lon: Double, excluded: String, _ completion: @escaping (NetworkRequestDecodable<T>) -> Void){
        getCurrentWeatherCalled = true
        do {
            let jsonData = getCurrentWeatherDataDictionary()
            let model = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(model))
        } catch let jsonError {
            completion(.failure(error: jsonError))
        }
    }
    var getCityCalled = false
    func getCity<T: Decodable>(lat: Double, lon: Double, _ completion: @escaping (NetworkRequestDecodable<T>) -> Void) {
        getCityCalled = true
        do {
            let jsonData = getCityDataDictionary()
            let model = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(model))
        } catch let jsonError {
            completion(.failure(error: jsonError))
        }
    }
}
