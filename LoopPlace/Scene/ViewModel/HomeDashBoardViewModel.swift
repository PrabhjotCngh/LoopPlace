//
//  HomeDashBoardViewModel.swift
//  LoopPlace
//
//

import Foundation

class HomeDashBoardViewModel: ObservableObject {
    
    //MARK: - Variables
    var networkRequest: NetworkRequestProtocol
    var requestSucceeded: () -> Void = {}
    var requestFailed: (String) -> Void = {_ in}
    
    init(networkRequest: NetworkRequestProtocol) {
        self.networkRequest = networkRequest
    }
    
    //MARK: - Functions
    /// Fetch list of categories
    @MainActor func fetchCategoryList() {
        print("API call")
        Task {
            do {
                networkRequest.performRequest(url: APIConstants.apiUrl) { [weak self] result in
                    if let _weakSelf = self {
                        switch result {
                        case .success(let responseModel):
                            print(responseModel)
                            break
                        case .failure(let networkError):
                            print(networkError)
                            break
                        }
                    }
                }
            } catch {
                requestFailed(error.localizedDescription)
            }
        }
        
    }
}
