//
//  WALoger.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation
import os

enum LogLevel {
    case debug
    case info
    case notice
    case error
    case fault
}

enum LogCategory: String {
    case general
    case backend
    case reachability
}

func log(message: String, category: LogCategory = .general, level: LogLevel = .debug) {
    // Log console message
    WALogger.shared.logMessageIntoConsole(message: message, category: category, level: level)
    
    // Log remote message
    WALogger.shared.logMessageIntoRemote(message: message, category: category, level: level)
}

class WALogger {
    
    static let shared = WALogger()
    
    func logMessageIntoConsole(message: String, category: LogCategory, level: LogLevel) {
        let logger = Logger.init(subsystem: "WeatherDemo", category: category.rawValue)

        switch level {
        case .debug:
            logger.debug("\(message)")
        case .info:
            logger.info("\(message)")
        case .notice:
            logger.notice("\(message)")
        case .error:
            logger.error("\(message)")
        case .fault:
            logger.fault("\(message)")
        }
    }
    
    func logMessageIntoRemote(message: String, category: LogCategory, level: LogLevel) {
       // Intergrate remote logger here. eg. bugfender, new relic, firebase and so on
    }
}
