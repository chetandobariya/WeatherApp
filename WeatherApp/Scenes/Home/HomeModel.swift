//
//  HomeModel.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//
import SwiftUI

// MARK: - iPhone/iPad Shared ViewModel
class HomeViewModel: ObservableObject {
    @Published var isAlertVisible = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
}

struct Home {

    struct FetchHome {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
}
