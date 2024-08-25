//
//  WeatherDetailConfigurator.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

class WeatherDetailConfigurator {

    var interactor: WeatherDetailInteractor!
    
    init() {}
    
    // MARK: Object lifecycle
    func configure(view: WeatherDetailView? = nil, iPadView: IPadWeatherDetailView? = nil) {
        if let view = view {
            self.interactor = WeatherDetailInteractor(viewModel: view.viewModel)
            view.output = self.interactor
        }

        if let iPadView = iPadView {
            self.interactor = WeatherDetailInteractor(viewModel: iPadView.viewModel)
            iPadView.output = self.interactor
        }
    }
}
