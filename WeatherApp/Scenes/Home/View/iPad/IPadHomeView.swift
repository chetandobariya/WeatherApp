//
//  IPadHomeView.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

struct IPadHomeView: View {
    @StateObject var viewModel: HomeViewModel

    var router = HomeRouter()
    var configurator = HomeConfigurator()
    @State var output: HomeInteractorInput!

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

extension IPadHomeView {
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

struct IPadHomeView_Previews: PreviewProvider {
    static var previews: some View {
    let viewModel = HomeViewModel()
    IPadHomeView(viewModel: viewModel, 
                  output: HomeInteractor(viewModel: viewModel))
        .previewDevices([.iPadAir2, .iPadPro12Inch], 
                        usingColorSchemes: [.dark, .light])
   }
}
