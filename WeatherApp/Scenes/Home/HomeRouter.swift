//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

protocol HomeRouterInput {
    func navigate() -> AnyView
}

class HomeRouter: HomeRouterInput {
  
    func navigate() -> AnyView {
        AnyView(EmptyView())
    }
}
