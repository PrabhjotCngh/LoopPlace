//
//  APIRequest.swift
//  LoopPlace
//
//

import Foundation

protocol NetworkRequestProtocol {
    typealias Handler = (Result<[CategoryListingModel], NetworkError>) -> Void
    func performRequest(url: String, completionHandler: @escaping Handler)
}

class APIManager: NetworkRequestProtocol {
    private let session: URLSession
    
    // By using a default argument (in this case .shared) we can add dependency
    // injection without making our app code more complicated.
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    /// Request the API data with parameters (T is a decodable model).
    func performRequest(url: String, completionHandler: @escaping Handler) {
        guard let url = URL(string: url) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completionHandler(.failure(.apiError(error)))
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            do {
                let responseModel = try JSONDecoder().decode([CategoryListingModel].self, from: data)
                completionHandler(.success(responseModel))
            } catch {
                completionHandler(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
