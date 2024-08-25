//
//  HomeInteractorTests.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

@testable import WeatherApp
import XCTest

class HomeInteractorTests: XCTestCase {

    // Subject under test
    var sut = HomeInteractor(viewModel: HomeViewModel())
    var outputSpy = HomeInteractorOutputSpy()
    var weatherWorkerMock = WeatherWorkerMock()

    override func setUp() {
        super.setUp()
        self.sut.output = outputSpy
        self.sut.weatherWorker = weatherWorkerMock
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class HomeInteractorOutputSpy: HomePresenterInput {
        var presentWeatherForecastResponse: Home.GetCurrentWeather.Response?
        func presentWeatherForecast(_ response: Home.GetCurrentWeather.Response) {
            presentWeatherForecastResponse = response
        }
        
        var presentCityNameResponse: Home.GetCityName.Response?
        func presentCityName(_ response: Home.GetCityName.Response) {
            presentCityNameResponse = response
        }
        
        var presentLoadingErrorResponse: LoadingError.Response?
        func presentLoadingError(_ response: LoadingError.Response) {
            presentLoadingErrorResponse = response
        }
    }

    // MARK: - Test cases
    func testShouldAskPresenterToPresentCurrentWeatherData() {
        // Given
        let lat = 34.99
        let lon = -96.93
        let excluded = "minutely"
        let request = Home.GetCurrentWeather.Request(lat: lat, lon: lon, excluded: excluded)

        // When
        sut.getCurrentWeather(request)
        
        // Then
        XCTAssertTrue(self.weatherWorkerMock.getCurrentWeatherCalled, "should ask worker to get current weather")

        guard let response = outputSpy.presentWeatherForecastResponse else {
            XCTFail("should respond")
            return
        }
        
        XCTAssertNotNil(response, "should ask presenter to present weather response")
    }
    
    func testShouldAskPresenterToPresentCityName() {
        // Given
        let lat = 34.99
        let lon = -96.93
        let request = Home.GetCityName.Request(lat: lat, lon: lon)

        // When
        sut.getCityName(request)
        
        // Then
        XCTAssertTrue(self.weatherWorkerMock.getCityCalled, "should ask worker to get city")

        guard let response = outputSpy.presentCityNameResponse else {
            XCTFail("should respond")
            return
        }
        
        XCTAssertNotNil(response, "should ask presenter to present city response")
    }
}
