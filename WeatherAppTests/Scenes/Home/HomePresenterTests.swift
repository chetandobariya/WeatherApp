//
//  HomePresenterTests.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

@testable import WeatherApp
import XCTest

class HomePresenterTests: XCTestCase {

    // Subject under test
    var sut = HomePresenter(viewModel: HomeViewModel())
    var outputSpy = HomePresenterOutputSpy()
    
    override func setUp() {
        super.setUp()
        self.sut.output = self.outputSpy
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class HomePresenterOutputSpy: HomeViewControllerInput {
        var displayWeatherForecast: Home.GetCurrentWeather.ViewModel?
        func displayWeatherForecast(_ viewModel: Home.GetCurrentWeather.ViewModel) {
            displayWeatherForecast = viewModel
        }
        
        var displayCityName: Home.GetCityName.ViewModel?
        func displayCityName(_ viewModel: Home.GetCityName.ViewModel) {
            displayCityName = viewModel
        }
        
        var displayedError: LoadingError.ViewModel?
        func displayError(_ viewModel: LoadingError.ViewModel) {
            displayedError = viewModel
        }
    }
    
    // MARK: - Test cases
    func testPresentErrorShouldAskToDisplayErrorViewModel() {
        // Given
        let error = LoadingError.LoadingError.noInternet
        
        // When
        let response = LoadingError.Response(error: error)
        sut.presentLoadingError(response)
        
        let loadExpectation = expectation(description: "should present error response")
        loadExpectation.isInverted = true
        
        waitForExpectations(timeout: 0.1) { (error) in
            XCTAssertNil(error)
        }
        
        // Then
        guard let viewModel = outputSpy.displayedError else {
            XCTFail("should return error viewModel")
            return
        }
        
        XCTAssertNotNil(viewModel.message, "viewModel should contain error message")
    }
    
    func testShouldAskViewControllerToDisplayWeatherForecast() {
        // Given
        let forecast = sampleForeCast()
      
        // When
        let response = Home.GetCurrentWeather.Response(forecast: forecast)
        sut.presentWeatherForecast(response)

        let loadExpectation = expectation(description: "should load weather forecast response")
        loadExpectation.isInverted = true

        waitForExpectations(timeout: 0.1) { (error) in
            XCTAssertNil(error)
        }

        //Then
        XCTAssertNotNil(outputSpy.displayWeatherForecast, "presenter should display weather forecast response")
        XCTAssertNotNil(outputSpy.displayWeatherForecast?.forecast?.current, "presenter should display current weather")
    }
    
    func testShouldAskViewControllerToDisplayCity() {
        // Given
        let city = sampleCity(name: "Dallas")
      
        // When
        let response = Home.GetCityName.Response(city: city.name ?? "")
        sut.presentCityName(response)

        let loadExpectation = expectation(description: "should load city response")
        loadExpectation.isInverted = true

        waitForExpectations(timeout: 0.1) { (error) in
            XCTAssertNil(error)
        }

        //Then
        XCTAssertNotNil(outputSpy.displayCityName, "presenter should display city response")
        XCTAssertEqual(outputSpy.displayCityName?.city, "Dallas", "presenter should display city name - Dallas")
    }
    
}
