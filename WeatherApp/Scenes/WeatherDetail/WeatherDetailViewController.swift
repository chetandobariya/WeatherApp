//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol WeatherDetailViewControllerInput {
    func displayError(_ viewModel: LoadingError.ViewModel)
}

class WeatherDetailViewController: WeatherDetailViewControllerInput {

    @ObservedObject var viewModel: WeatherDetailViewModel
    init(viewModel: WeatherDetailViewModel) {
        self.viewModel = viewModel
    }

    func displayError(_ viewModel: LoadingError.ViewModel) {
        self.viewModel.alertTitle = viewModel.title
        self.viewModel.alertMessage = viewModel.message
        self.viewModel.isAlertVisible = true
    }
}
