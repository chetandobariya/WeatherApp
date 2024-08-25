//
//  HomePresenter.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Combine
import SwiftUI

protocol HomePresenterInput {
    func presentLoadingError(_ response: LoadingError.Response)
    func presentWeatherForecast(_ response: Home.GetCurrentWeather.Response)
    func presentCityName(_ response: Home.GetCityName.Response)
}

class HomePresenter: HomePresenterInput {

    var output: HomeViewControllerInput!
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.output = HomeViewController(viewModel: viewModel)
    }

    func presentWeatherForecast(_ response: Home.GetCurrentWeather.Response) {
        DispatchQueue.main.async { [weak self] in
            let viewModel = Home.GetCurrentWeather.ViewModel(forecast: response.forecast)
            self?.output.displayWeatherForecast(viewModel)
        }
    }
    func presentLoadingError(_ response: LoadingError.Response) {
        DispatchQueue.main.async { [weak self] in
            let errorHelper = ErrorHelper.shared
            let viewModel = errorHelper.handleLoadingErrorResponse(response: response)
            self?.output.displayError(viewModel)
        }
    }
    func presentCityName(_ response: Home.GetCityName.Response) {
        DispatchQueue.main.async { [weak self] in
            let viewModel = Home.GetCityName.ViewModel(city: response.city)
            self?.output.displayCityName(viewModel)
        }
    }

}
