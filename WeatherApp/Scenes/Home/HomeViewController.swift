//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol HomeViewControllerInput {
    func displayError(_ viewModel: LoadingError.ViewModel)
    func displayWeatherForecast(_ viewModel: Home.GetCurrentWeather.ViewModel)
    func displayCityName(_ viewModel: Home.GetCityName.ViewModel)

}

class HomeViewController: HomeViewControllerInput {

    @ObservedObject var viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    func displayWeatherForecast(_ viewModel: Home.GetCurrentWeather.ViewModel) {
        self.viewModel.isLoading = false
        self.viewModel.forecast = viewModel.forecast
    }
    
    func displayCityName(_ viewModel: Home.GetCityName.ViewModel) {
        self.viewModel.cityName = viewModel.city
    }
    
    func displayError(_ viewModel: LoadingError.ViewModel) {
        self.viewModel.isLoading = false
        self.viewModel.alertTitle = viewModel.title
        self.viewModel.alertMessage = viewModel.message
        self.viewModel.isAlertVisible = true
    }
}
