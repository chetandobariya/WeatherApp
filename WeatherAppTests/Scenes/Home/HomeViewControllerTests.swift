//
//  HomeViewControllerTests.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

@testable import WeatherApp
import XCTest

class HomeViewControllerTests: XCTestCase {
    
    // Subject under test
    var sut: HomeView!
    var outputSpy = HomeViewControllerOutputSpy()
    
    override func setUp() {
        super.setUp()
        testHomeScreenConfiguration()
    }
    
    func testHomeScreenConfiguration() {
        // Make sure the view gets loaded
        let viewModel = HomeViewModel()
        
        sut = HomeView(viewModel: viewModel,
                        output: outputSpy)
        XCTAssertNotNil(self.sut, "Home view should not be nil")
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
    func testShouldAskInteractorToFetchCurrentWeatherData() {
        // Given
        let lat = 34.99
        let lon = -96.93
        
        // When
        sut.fetchCurrentWeatherData(lat: lat, lon: lon)
        
        // Then
        XCTAssertEqual(self.outputSpy.getCurrentWeatherRequestCalled, true, "should ask interactor to fetch current weather data")
        XCTAssertNotNil(self.outputSpy.getCurrentWeatherRequest, "should have valid fetch current weather request to the interactor")
    }
    
    func testShouldAskInteractorToFetchCityName() {
        // Given
        let lat = 34.99
        let lon = -96.93
        UserDefaults.standard.removeObject(forKey: "cityName")

        // When
        sut.fetchCityName(lat: lat, lon: lon)
        
        // Then
        XCTAssertEqual(self.outputSpy.getCityNameRequestCalled, true, "should ask interactor to get city information")
        XCTAssertNotNil(self.outputSpy.getCityNameRequest, "should have valid get city information request to the interactor")
    }
    
    func testShouldNotAskInteractorToFetchCityName() {
        // Given
        let lat = 34.99
        let lon = -96.93
        UserDefaults.standard.setValue("Dallas", forKey: "cityName")
        // When
        sut.fetchCityName(lat: lat, lon: lon)
        
        // Then
        XCTAssertEqual(self.outputSpy.getCityNameRequestCalled, false, "should not ask interactor to get city name as it is already saved in userDefaults")
        XCTAssertNil(self.outputSpy.getCityNameRequest, "shold not have any requrst to interactor for getting city name")
    }
}
