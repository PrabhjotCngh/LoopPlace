//
//  HomeDashBoardViewModel.swift
//  LoopPlace
//
//

import Foundation

class HomeDashBoardViewModel: ObservableObject {
    
    //MARK: - Variables
    var networkRequest: NetworkRequestProtocol
    var requestFailed: (String) -> Void = {_ in}
    @Published var categoryList: [CategoryListingModel] = []
    
    init(networkRequest: NetworkRequestProtocol) {
        self.networkRequest = networkRequest
    }
    
    //MARK: - Functions
    /// Fetch list of categories
    func fetchCategoryList() {
        networkRequest.performRequest(url: APIConstants.categoryListAPIUrl) { [weak self] result in
            if let _weakSelf = self {
                switch result {
                case .success(let responseModel):
                    DispatchQueue.main.async {
                        _weakSelf.categoryList = responseModel
                    }
                case .failure(NetworkError.invalidURL):
                    _weakSelf.requestFailed(APIConstants.APIErrorMessages.invalidURL)
                case .failure(NetworkError.invalidData):
                    _weakSelf.requestFailed(APIConstants.APIErrorMessages.invalidData)
                case .failure(NetworkError.decodingError(let error)), .failure(NetworkError.apiError(let error)):
                    _weakSelf.requestFailed(error.localizedDescription)
                default:
                    _weakSelf.requestFailed(APIConstants.APIErrorMessages.genericMessage)
                }
            }
        }
    }
}
