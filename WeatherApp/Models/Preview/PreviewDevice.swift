//
//  PreviewDevice.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation

/// Supported device types can be found by running the following command from terminal.
/// ```$ xcrun simctl list devicetypes```

public enum PreviewDeviceModel: String, CaseIterable {
    // iPod
    case iPodTouch7thGen = "iPod touch (7th generation)"
    
    // iPhone
    case iPhone6s = "iPhone 6s"
    case iPhone6sPlus = "iPhone 6s Plus"
    case iPhoneSE1stGen = "iPhone SE (1st generation)"
    case iPhoneSE2ndGen = "iPhone SE (2nd generation)"
    case iPhone7 = "iPhone 7"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhone8 = "iPhone 8"
    case iPhone8Plus = "iPhone 8 Plus"
    case iPhoneX = "iPhone X"
    case iPhoneXs = "iPhone Xs"
    case iPhoneXsMax = "iPhone Xs Max"
    case iPhoneXr = "iPhone Xʀ"
    case iPhone11 = "iPhone 11"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    case iPhone12 = "iPhone 12"
    case iPhone12mini = "iPhone 12 mini"
    case iPhone12Pro = "iPhone 12 Pro"
    case iPhone12ProMax = "iPhone 12 Pro Max"
    case iPhone13mini = "iPhone 13 mini"
    case iPhone13 = "iPhone 13"
    case iPhone13Pro = "iPhone 13 Pro"
    case iPhone13ProMax = "iPhone 13 Pro Max"
    case iPhone14 = "iPhone 14"
    case iPhone14Pro = "iPhone 14 Pro"
    case iPhone14ProMax = "iPhone 14 Pro Max"
    case iPhone14Plus = "iPhone 14 Plus"

    // iPad
    case iPadMini4 = "iPad mini 4"
    case iPadMini5thGen = "iPad mini (5th generation)"
    case iPadAir2 = "iPad Air 2"
    case iPadAir3rdGen = "iPad Air (3rd generation)"
    case iPadAir4thGen = "iPad Air (4th generation)"

    case iPad5thGen = "iPad (5th generation)"
    case iPad6thGen = "iPad (6th generation)"
    case iPad7thGen = "iPad (7th generation)"
    case iPad8thGen = "iPad (8th generation)"
    
    case iPadPro9Inch = "iPad Pro (9.7-inch)"
    case iPadPro10Inch = "iPad Pro (10.5-inch)"
    case iPadPro11Inch = "iPad Pro (11-inch)"
    case iPadPro12Inch = "iPad Pro (12.9-inch) (1st generation)"
    case iPadPro12Inch2ndGen = "iPad Pro (12.9-inch) (2nd generation)"
    case iPadPro12Inch3rdGen = "iPad Pro (12.9-inch) (3rd generation)"
    case iPadPro12Inch4thGen = "iPad Pro (12.9-inch) (4th generation)"
}
