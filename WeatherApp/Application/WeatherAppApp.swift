//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    let homeViewModel = HomeViewModel()

    //TODO: currently iphone screen loaded in ipad app. we can design ipad screen later
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homeViewModel)
        }
    }
}
