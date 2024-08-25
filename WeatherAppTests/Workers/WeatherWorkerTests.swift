//
//  WeatherWorkerTests.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

@testable import WeatherApp
import XCTest

class WeatherWorkerTests: XCTestCase {

    // Subject under test
    var sut = WeatherWorker()
    var backendMock = BackendAdapterMock()
    
    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        sut.backend = backendMock
    }
    
    // MARK: Tests
    
    func testGetCurrentWeather() {
        // Given
        let lat = 34.99
        let lon = -96.93
        let excluded = "minutely"
        let endpoint = Endpoint(api: .getCurrentWeather(lat, lon, excluded))
        
        // When
        XCTAssertNotNil(endpoint.api.url.absoluteString, "request url should not be nil")
        let responseExpectation = self.expectation(description: "did receive response")

        // Then
        sut.backend.genericFetch(endpoint: endpoint) {(result: NetworkRequestDecodable<Forecast>) in
            responseExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.2) { (optionalError) in

            if let error = optionalError {
                XCTFail()
                print(error.localizedDescription)
            }
            
            XCTAssertEqual(self.backendMock.endpointCalled!.path, API.getCurrentWeather(lat, lon, excluded).path, "should contain get current weather endpoint path")
            XCTAssertNil(optionalError)
        }
    }
    
    func testGetCityName() {
        // Given
        let lat = 34.99
        let lon = -96.93
        let endpoint = Endpoint(api: .getCityName(lat, lon))
        
        // When
        XCTAssertNotNil(endpoint.api.url.absoluteString, "request url should not be nil")
        let responseExpectation = self.expectation(description: "did receive response")

        // Then
        sut.backend.genericFetch(endpoint: endpoint) {(result: NetworkRequestDecodable<[City]>) in
            responseExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.2) { (optionalError) in

            if let error = optionalError {
                XCTFail()
                print(error.localizedDescription)
            }
            
            XCTAssertEqual(self.backendMock.endpointCalled!.path, API.getCityName(lat, lon).path, "should contain get city name endpoint path")
            XCTAssertNil(optionalError)
        }
    }
   
}
