//
//  HomeInteractor.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol HomeInteractorInput {
    func getCurrentWeather(_ request: Home.GetCurrentWeather.Request)
    func getCityName(_ request: Home.GetCityName.Request)
}

class HomeInteractor: HomeInteractorInput {

    var output: HomePresenterInput!
    @ObservedObject var viewModel: HomeViewModel
    var weatherWorker = WeatherWorker.shared

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.output = HomePresenter(viewModel: viewModel)
    }
    
    func getCurrentWeather(_ request: Home.GetCurrentWeather.Request) {
        self.weatherWorker.getCurrentWeather(lat: request.lat, lon: request.lon, excluded: request.excluded) {(result: NetworkRequestDecodable<Forecast>) in
            switch result {
            case .success(let forecast):
                let response = Home.GetCurrentWeather.Response(forecast: forecast)
                self.output.presentWeatherForecast(response)
            case .failure(let error):
                self.output.presentLoadingError(LoadingError.Response(error: .generalFailure(error)))
            case .noInternet:
                self.output.presentLoadingError(LoadingError.Response(error: .noInternet))
            case .emptySuccess:
                break
            }
        }
    }
    
    func getCityName(_ request: Home.GetCityName.Request) {
        self.weatherWorker.getCity(lat: request.lat, lon: request.lon) {(result: NetworkRequestDecodable<[City]>) in
            switch result {
            case .success(let cities):
                let response = Home.GetCityName.Response(city: cities.first?.name ?? "")
                self.output.presentCityName(response)
            case .failure(let error):
                self.output.presentLoadingError(LoadingError.Response(error: .generalFailure(error)))
            case .noInternet:
                self.output.presentLoadingError(LoadingError.Response(error: .noInternet))
            case .emptySuccess:
                break
            }
        }
    }
}
