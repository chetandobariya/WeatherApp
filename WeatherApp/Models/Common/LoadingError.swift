//
//  LoadingError.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation

struct LoadingError {
   
    enum LoadingError {
        case noInternet, timeout, generalFailure(Error), empty
    }
    
    struct Request {
    }
    
    struct Response {
        let error: LoadingError
    }
    
    struct ViewModel {
        let title: String
        let message: String
    }
}
