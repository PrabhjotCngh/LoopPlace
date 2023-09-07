//
//  CollectionListingView.swift
//  LoopPlace
//
//

import SwiftUI

struct CollectionListingView: View {
    //MARK: - Properties
    let categoryId : Int
    @StateObject private var collectionListingViewModel = CollectionListingViewModel(networkRequest: NetworkServiceFactory.create())
    @State private var showAlert = false
    @State private var errorMessage = String()
    
    //MARK: - Private functions
    private func callbackHandler() {
        collectionListingViewModel.requestFailed = { error in
            showAlert = true
            errorMessage = error
        }
    }
    
    //MARK: - Body
    var body: some View {
        List(collectionListingViewModel.categoryItemsList, id: \.itemID) { item in
            NavigationLink {
                AdDetailView(adDetail: item)
            } label: {
                ColectionListingRowView(category: item)
                    .padding(.vertical, 4)
            }
        } //: List
        .onAppear {
            collectionListingViewModel.fetchCategoryItemsList(id: categoryId)
            callbackHandler()
        }
        .alert(HomeDashboardViewConstants.Text.error, isPresented: $showAlert) {
        } message: {
            Text(errorMessage)
        }
    }
}

//MARK: - Preview
struct CollectionListingView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListingView(categoryId: 1)
    }
}
