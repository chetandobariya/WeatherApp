//
//  WeatherDetailPresenter.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Combine
import SwiftUI

protocol WeatherDetailPresenterInput {
    func presentLoadingError(_ response: LoadingError.Response)
}

class WeatherDetailPresenter: WeatherDetailPresenterInput {

    var output: WeatherDetailViewControllerInput!
    @ObservedObject var viewModel: WeatherDetailViewModel
    
    init(viewModel: WeatherDetailViewModel) {
        self.viewModel = viewModel
        self.output = WeatherDetailViewController(viewModel: viewModel)
    }

    func presentLoadingError(_ response: LoadingError.Response) {
        DispatchQueue.main.async { [weak self] in
            let errorHelper = ErrorHelper.shared
            let viewModel = errorHelper.handleLoadingErrorResponse(response: response)
            self?.output.displayError(viewModel)
        }
    }
}
