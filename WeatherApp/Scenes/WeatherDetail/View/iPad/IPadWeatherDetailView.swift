//
//  IPadWeatherDetailView.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

struct IPadWeatherDetailView: View {
    @StateObject var viewModel: WeatherDetailViewModel

    var router = WeatherDetailRouter()
    var configurator = WeatherDetailConfigurator()
    @State var output: WeatherDetailInteractorInput!

    var body: some View {
        VStack {
            
        }
        .onAppear {
            self.configurator.configure(iPadView: self)
        }
        .alert(isPresented: $viewModel.isAlertVisible) {
            showAlert(title: viewModel.alertTitle, message: viewModel.alertMessage)
        }
    }
}

extension IPadWeatherDetailView {
    // MARK: Show Alerts
    func showAlert(title: String, message: String) -> Alert {
        Alert(title: Text(title),
              message: Text(message),
              dismissButton: .default(
                Text("Ok"),
                action: {
                    print("Alert button clicked")
                }
              )
        )
    }
}

struct IPadWeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
    let viewModel = WeatherDetailViewModel()
    IPadWeatherDetailView(viewModel: viewModel, 
                  output: WeatherDetailInteractor(viewModel: viewModel))
        .previewDevices([.iPadAir2, .iPadPro12Inch], 
                        usingColorSchemes: [.dark, .light])
   }
}
