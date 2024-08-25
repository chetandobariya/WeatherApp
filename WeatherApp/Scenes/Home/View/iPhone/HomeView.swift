//
//  HomeView.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var router = HomeRouter()
    var configurator = HomeConfigurator()
    @State var output: HomeInteractorInput!

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

extension HomeView {
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
    let viewModel = HomeViewModel()
    HomeView(viewModel: viewModel, 
              output: HomeInteractor(viewModel: viewModel))
        .previewDevices([.iPhone11, .iPhone12ProMax],
                        usingColorSchemes: [.dark, .light])
   }
}
