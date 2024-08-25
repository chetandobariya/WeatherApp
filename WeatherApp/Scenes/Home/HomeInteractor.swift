//
//  HomeInteractor.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol HomeInteractorInput {
}

class HomeInteractor: HomeInteractorInput {

    var output: HomePresenterInput!
    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.output = HomePresenter(viewModel: viewModel)
    }
}
