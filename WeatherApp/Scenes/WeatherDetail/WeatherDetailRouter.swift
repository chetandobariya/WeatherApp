//
//  WeatherDetailRouter.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol WeatherDetailRouterInput {
    func navigate() -> AnyView
}

class WeatherDetailRouter: WeatherDetailRouterInput {
  
    func navigate() -> AnyView {
        AnyView(EmptyView())
    }
}
