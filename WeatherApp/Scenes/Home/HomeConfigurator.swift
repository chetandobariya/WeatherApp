//
//  HomeConfigurator.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

class HomeConfigurator {

    var interactor: HomeInteractor!
    
    init() {}
    
    // MARK: Object lifecycle
    func configure(view: HomeView? = nil, iPadView: IPadHomeView? = nil) {
        if let view = view {
            self.interactor = HomeInteractor(viewModel: view.viewModel)
            view.output = self.interactor
        }

        if let iPadView = iPadView {
            self.interactor = HomeInteractor(viewModel: iPadView.viewModel)
            iPadView.output = self.interactor
        }
    }
}
