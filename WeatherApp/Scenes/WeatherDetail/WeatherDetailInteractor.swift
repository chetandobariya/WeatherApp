//
//  WeatherDetailInteractor.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol WeatherDetailInteractorInput {
}

class WeatherDetailInteractor: WeatherDetailInteractorInput {

    var output: WeatherDetailPresenterInput!
    @ObservedObject var viewModel: WeatherDetailViewModel

    init(viewModel: WeatherDetailViewModel) {
        self.viewModel = viewModel
        self.output = WeatherDetailPresenter(viewModel: viewModel)
    }
}
