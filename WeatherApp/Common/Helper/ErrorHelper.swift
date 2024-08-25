//
//  ErrorHelper.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation

protocol ErrorHelperInterface {
    func handleLoadingErrorResponse(response: LoadingError.Response, title: String) -> LoadingError.ViewModel
}

struct ErrorHelper: ErrorHelperInterface {
    static var shared = { ErrorHelper() }()
    func handleLoadingErrorResponse(response: LoadingError.Response, title: String = "Error") -> LoadingError.ViewModel {
        var message = ""
        let title = title
        switch response.error {
        case .empty:
            message = Constants.Error.Loading.empty
        case .noInternet:
            message = Constants.Error.Loading.noInternet
        case .timeout:
            message = Constants.Error.Loading.timeOut
            
        case .generalFailure(let error):
            if let failureMessage = (error as NSError).userInfo["message"] as? String {
                message = failureMessage
            } else {
                let updateFailedMessage = Constants.Error.Loading.updateFailedWithError(error.localizedDescription)
                message = updateFailedMessage
            }
        }
        
        let viewModel = LoadingError.ViewModel(title: title, message: message)
        return viewModel
    }
}
