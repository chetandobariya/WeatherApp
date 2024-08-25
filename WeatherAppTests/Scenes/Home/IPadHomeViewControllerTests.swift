//
//  IPadHomeViewControllerTests.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

@testable import WeatherApp
import XCTest

class IPadHomeViewControllerTests: XCTestCase {
    
    // Subject under test
    var sut: IPadHomeView!
    var outputSpy = HomeViewControllerOutputSpy()
    
    override func setUp() {
        super.setUp()
        testHomeScreenConfiguration()
    }
    
    func testHomeScreenConfiguration() {
        // Make sure the view gets loaded
        let viewModel = HomeViewModel()
        
        sut = IPadHomeView(viewModel: viewModel,
                        output: outputSpy)
        XCTAssertNotNil(self.sut, "IPad Home view should not be nil")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class HomeViewControllerOutputSpy: HomeInteractorInput {
        var getCurrentWeatherRequest:  Home.GetCurrentWeather.Request?
        var getCurrentWeatherRequestCalled = false
        func getCurrentWeather(_ request: Home.GetCurrentWeather.Request) {
            getCurrentWeatherRequest = request
            getCurrentWeatherRequestCalled = true
        }
        
        var getCityNameRequest:  Home.GetCityName.Request?
        var getCityNameRequestCalled = false
        func getCityName(_ request: Home.GetCityName.Request) {
            getCityNameRequest = request
            getCityNameRequestCalled = true
        }
    }
    
    // MARK: - Test cases
}
