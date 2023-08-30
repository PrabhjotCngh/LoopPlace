//
//  APIRequest.swift
//  LoopPlace
//
//

import Foundation

protocol NetworkRequestProtocol {
    typealias AdsHandler = (Result<[CategoryListingModel], NetworkError>) -> Void
    typealias SelectedAdHandler = (Result<[CategoryModel], NetworkError>) -> Void
    func getAds(url: String, completionHandler: @escaping AdsHandler)
    func getSelectedAd(url: String, completionHandler: @escaping SelectedAdHandler)
}

class APIManager: NetworkRequestProtocol {
    private let session: URLSession
    
    // By using a default argument (in this case .shared) we can add dependency
    // injection without making our app code more complicated.
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    //MARK: - Get all advertisments
    func getAds(url: String, completionHandler: @escaping AdsHandler) {
        /// Prepare URL
        guard let url = URL(string: url) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        /// Perform network request
        performRequest(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let responseModel = try JSONDecoder().decode([CategoryListingModel].self, from: data)
                    completionHandler(.success(responseModel))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func getSelectedAd(url: String, completionHandler: @escaping SelectedAdHandler) {
        /// Prepare URL
        guard let url = URL(string: url) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        /// Perform network request
        performRequest(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let responseModel = try JSONDecoder().decode([CategoryModel].self, from: data)
                    completionHandler(.success(responseModel))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

//MARK: - Perform URLSession request
extension APIManager {
    func performRequest(url: URL, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
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
            completionHandler(.success(data))
        }.resume()
    }
}
