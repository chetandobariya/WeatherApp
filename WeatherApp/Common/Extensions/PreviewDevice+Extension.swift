//
//  PreviewDevice+Extension.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import SwiftUI

public extension PreviewDevice {
    init(device: PreviewDeviceModel) {
        self.init(rawValue: device.rawValue)
    }
}

