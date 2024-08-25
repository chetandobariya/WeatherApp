//
//  HomeModel.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//
import SwiftUI

// MARK: - iPhone/iPad Shared ViewModel
class HomeViewModel: ObservableObject {
    @Published var forecast: Forecast?
    @Published var cityName = ""
    @Published var isLoading = false
    @Published var isAlertVisible = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
}

struct Home {

    struct GetCurrentWeather {
        struct Request {
            let lat: Double
            let lon: Double
            let excluded: String
        }
        struct Response {
            let forecast: Forecast?
        }
        struct ViewModel {
            let forecast: Forecast?
        }
    }
    
    struct GetCityName {
        struct Request {
            let lat: Double
            let lon: Double
        }
        struct Response {
            let city: String
        }
        struct ViewModel {
            let city: String
        }
    }
}
