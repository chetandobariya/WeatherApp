//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol HomeViewControllerInput {
    func displayError(_ viewModel: LoadingError.ViewModel)
}

class HomeViewController: HomeViewControllerInput {

    @ObservedObject var viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    func displayError(_ viewModel: LoadingError.ViewModel) {
        self.viewModel.alertTitle = viewModel.title
        self.viewModel.alertMessage = viewModel.message
        self.viewModel.isAlertVisible = true
    }
}
