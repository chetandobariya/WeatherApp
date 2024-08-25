//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//


import SwiftUI

struct WeatherDataView: View {
    var forecast: Forecast?
    @StateObject private var viewModel = ImageDownloader()
    
    var body: some View {
        
        VStack(spacing: 8){
            if let alert = forecast?.alerts?.first {
                CustomStackView {
                    Label {
                        Text(alert.event ?? "")
                    } icon: {
                        Image(systemName: "circle.hexagongrid.fill")
                    }
                    
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(alert.tags?.first ?? "")
                            .font(.title3.bold())
                        
                        Text(alert.description ?? "")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                }
            }
            
            HStack{
                CustomStackView {
                    Label {
                        Text("UV Index")
                    } icon: {
                        Image(systemName: "sun.min")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(String(format: "%.0f", forecast?.current?.uvi ?? 0))%")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Low")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label {
                        Text("Humidity")
                    } icon: {
                        Image(systemName: "drop.fill")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(String(format: "%.0f", forecast?.current?.humidity ?? 0))%")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("in last 24 hours")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)
            
            if let daily = forecast?.daily {
                CustomStackView {
                    Label {
                        Text("Daily Forecast")
                    } icon: {
                        Image(systemName: "calendar")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(daily) { day in
                            VStack {
                                HStack(spacing: 15){
                                    Text(day.currentTime?.dayWord() ?? "")
                                        .font(.title3.bold())
                                        .foregroundStyle(.white)
                                    // max widht...
                                        .frame(width: 60,alignment: .leading)
                                    
                                    if let image = viewModel.downloadedImage {
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 30)
                                    } else {
                                        ProgressView()
                                            .onAppear {
                                                viewModel.downloadImage(from: day.weather?.first?.weatherIconURL?.absoluteString)
                                            }
                                    }
                                    
                                    Text("\(Int(day.temperature?.min ?? 0))")
                                        .font(.title3.bold())
                                        .foregroundStyle(.secondary)
                                        .foregroundStyle(.white)
                                    
                                    // Progress Bar....
                                    ZStack(alignment: .leading) {
                                        
                                        Capsule()
                                            .fill(.tertiary)
                                            .foregroundStyle(.white)
                                        
                                        // for width...
                                        GeometryReader{proxy in
                                            
                                            Capsule()
                                                .fill(.linearGradient(.init(colors: [.orange,.red]), startPoint: .leading, endPoint: .trailing))
                                                .frame(width: ((day.temperature?.day ?? 1) / 140) * proxy.size.width)
                                        }
                                    }
                                    .frame(height: 4)
                                    
                                    Text("\(Int(day.temperature?.max ?? 0))˚")
                                        .font(.title3.bold())
                                        .foregroundStyle(.white)
                                }
                                Divider()
                            }
                            .padding(.vertical,8)
                        }
                    }
                }
            }
            
        }
    }
}


#Preview {
    WeatherDataView()
}
