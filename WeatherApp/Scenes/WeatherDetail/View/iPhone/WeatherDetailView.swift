//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

struct WeatherDetailView: View {
    @StateObject var viewModel: WeatherDetailViewModel

    var router = WeatherDetailRouter()
    var configurator = WeatherDetailConfigurator()
    @State var output: WeatherDetailInteractorInput!

    var body: some View {
        VStack {
            
        }
        .onAppear {
            self.configurator.configure(view: self)
        }
        .alert(isPresented: $viewModel.isAlertVisible) {
            showAlert(title: viewModel.alertTitle, message: viewModel.alertMessage)
        }
    }
}

extension WeatherDetailView {
    // MARK: Show Alerts
    func showAlert(title: String, message: String) -> Alert {
        Alert(title: Text(title),
              message: Text(message),
              dismissButton: .default(
                Text("OK"),
                action: {
                    print("Alert button cliked.")
                }
              )
        )
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
    let viewModel = WeatherDetailViewModel()
    WeatherDetailView(viewModel: viewModel, 
              output: WeatherDetailInteractor(viewModel: viewModel))
        .previewDevices([.iPhone11, .iPhone12ProMax],
                        usingColorSchemes: [.dark, .light])
   }
}
