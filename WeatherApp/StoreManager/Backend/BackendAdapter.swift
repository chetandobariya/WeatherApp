//
//  BackendAdapter.swift
//  WeatherApp
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation

enum NetworkRequestDecodable<ResultType> {
    case success(ResultType)
    case emptySuccess
    case failure(error: Error)
    case noInternet
}

protocol Backend {
    func genericFetch<T: Decodable>(endpoint: Endpoint,
                                    completion: @escaping (_ model: NetworkRequestDecodable<T>) -> Void)
}

class BackendAdapter: Backend {
    static var shared: Backend = { BackendAdapter() }()
    
    func genericFetch<T: Decodable>(endpoint: Endpoint,
                                    completion: @escaping (_ model: NetworkRequestDecodable<T>) -> Void) {
        
        log(message: "url: \(endpoint.api.url)", category: .backend, level: .info)
        log(message: "method: \(endpoint.api.method)", category: .backend, level: .info)
        log(message: "requestParameters: \(String(describing: endpoint.api.requestParameters))", category: .backend, level: .info)
        
        //TODO: make reachability service reactive later on
        guard ReachabilityHelper.isConnectedToNetwork() == true else {
            log(message: "No internet connection found", category: .reachability, level: .info)
            completion(.noInternet)
            return
        }
        guard let url = URL(string: endpoint.api.url.absoluteString) else {
            let error = NSError(domain: Constants.Error.domain, code: 0, userInfo: ["message": "Invalid URL"])
            completion(.failure(error: error))
            return
        }
        
        let request = createRequest(url: url, method: endpoint.api.method)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                log(message: "Backend error: \(error.localizedDescription)", category: .backend, level: .error)
                self.handleErrorForGenericFetch(error, completion: completion)
                return
            }
            
            guard let data = data else {
                completion(.emptySuccess)
                log(message: "emptySuccess: \(endpoint.api.url)", category: .backend, level: .debug)
                return
            }
            
            // Handle received data
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch let jsonError {
                completion(.failure(error: jsonError))
            }
        }
        
        task.resume()
        
    }
    
    func createRequest(url: URL, method: HTTPMethod, body: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        return request
    }
    
    // MARK: handle errors
    private func handleErrorForGenericFetch<T: Decodable>(_ error: Error,
                                                          response: HTTPURLResponse? = nil,
                                                          completion: @escaping (_ model: NetworkRequestDecodable<T>) -> Void) {
        let customError = getNSError(error, response)
        completion(.failure(error: customError))
    }
    
    private func getNSError(_ error: Error,
                            _ response: HTTPURLResponse? = nil) -> Error {
        let code = (error as NSError).code
        let nsError = NSError(domain: Constants.Error.domain, code: code, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
        
        switch code {
        case 401:
            //TODO: handle Unauthorized - get new token
            break
        case 403:
            //TODO: handle raise force logout from here
            break
        default:
            break
        }
        return nsError
    }
    
}
