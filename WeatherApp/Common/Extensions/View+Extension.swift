//
//  View+Extension.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation
import SwiftUI

extension View {
    // MARK: Preview Devices
    
    /// Overrides the device for a preview.
    /// - usage:  ```.previewDevice(.iPhone7)```
    ///
    /// - Parameter device: the chosen device
    /// - Returns: The Xcode preview canvas `View`
    func previewDevice(_ device: PreviewDeviceModel) -> some View {
        let device: PreviewDevice? = PreviewDevice(device: device)
        return previewDevice(device)
    }
    
    /// Overrides the device for a preview, showing also the device name as canvas name
    /// -  usage:  ```.previewNamedDevice(.iPhone7)```
    ///
    /// - Parameter device: the chosen device
    /// - Returns: The Xcode preview canvas `View` with the visible name label below preview canvas
    func previewNamedDevice(_ device: PreviewDeviceModel) -> some View {
        previewDevice(device)
            .previewDeviceName(device)
    }
    
    /// Provides a user visible name shown in the editor.
    /// - Parameter device: the chosen device
    /// - Returns: The visible name label below preview canvas
    func previewDeviceName(_ device: PreviewDeviceModel) -> some View {
        previewDisplayName(device.rawValue)
    }
    
    /// Overrides the device for a preview with a given color scheme
    /// - usage: ```.previewDevice(.iPhone7, withColorScheme: .dark)```
    ///
    /// - Parameters:
    ///   - device: the chosen device
    ///   - colorScheme: the color scheme to be used
    /// - Returns: The Xcode preview canvas `View`
    func previewDevice(_ device: PreviewDeviceModel, withColorScheme colorScheme: ColorScheme) -> some View {
        previewDevice(device)
            .colorScheme(colorScheme)
    }
    
    /// Overrides the device for a preview, showing the device name as canvas name, with a given color scheme
    /// - usage: ```.previewNamedDevice(.iPhone7, withColorScheme: .dark)```
    ///
    /// - Parameters:
    ///   - device: the chosen device
    ///   - colorScheme: the color scheme to be used
    /// - Returns: The Xcode preview canvas `View`
    func previewNamedDevice(_ device: PreviewDeviceModel, withColorScheme colorScheme: ColorScheme) -> some View {
        previewDevice(device)
            .previewDeviceName(device)
            .colorScheme(colorScheme)
    }
    
    /// Returns a list of devices for a preview with a given color schemes
    /// The returned devices has a default device name equal to the name of the device
    ///
    /// - usage: ```.previewDevices([.iPhone7, .iPhoneSE, .iPhoneX], withColorScheme: [.dark, .light])```
    ///
    /// - Parameters:
    ///   - devices: a list of chosen devices
    ///   - colorSchemes: a list of color schemes to be used
    /// - Returns: The Xcode preview canvas `View`
    func previewDevices(_ devices: [PreviewDeviceModel], usingColorSchemes colorSchemes: [ColorScheme] = [.light]) -> some View {
        ForEach(devices, id: \.self) { device in
            ForEach(colorSchemes, id: \.self) { scheme in
                self.previewNamedDevice(device, withColorScheme: scheme)
            }
        }
    }
    
}
func delay(_ seconds: TimeInterval, dispatchQueue: DispatchQueue = .main, completion: @escaping () -> Void) {
    dispatchQueue.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}

