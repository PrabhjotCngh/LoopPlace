//
//  HomeDashBoardView.swift
//  LoopPlace
//
//

import SwiftUI

struct HomeDashBoardView: View {
    //MARK: - Properties
    @StateObject private var homeDashboardViewModel = HomeDashBoardViewModel(networkRequest: NetworkServiceFactory.create())
    @State private var showAlert = false
    @State private var errorMessage = String()
    
    //MARK: - Private functions
    private func callbackHandler() {
        homeDashboardViewModel.requestFailed = { error in
            showAlert = true
            errorMessage = error
        }
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView()
                .padding(.horizontal, 15)
                .padding(.bottom)
                .background(.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    let categoryList = homeDashboardViewModel.categoryList
                    ForEach(categoryList, id: \.Id) { item in
                        NavigationLink {
                            CollectionListingView(categoryId: item.Id)
                        } label: {
                            ProductItemView(product: item)
                        }
                    }
                    
                } //: HStack
                .padding(.vertical, 32)
                .padding(.leading, 32)
                .padding(.trailing, 32)
            } //: ScrollView
            
            if !showAlert {
                TitleView(title: HomeDashboardViewConstants.Text.hotDeals)
                    .padding(.horizontal, 16)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    let categoryList = homeDashboardViewModel.categoryList
                    ForEach(categoryList, id: \.Id) { item in
                        NavigationLink {
                            CollectionListingView(categoryId: item.Id)
                        } label: {
                            ProductItemView(product: item)
                        }
                    }
                    
                } //: HStack
                .padding(.vertical, 32)
                .padding(.leading, 32)
                .padding(.trailing, 32)
            } //: ScrollView
            
            Spacer()
        } //: VStack
        .onAppear {
            homeDashboardViewModel.fetchCategoryList()
            callbackHandler()
        }
        .alert(HomeDashboardViewConstants.Text.error, isPresented: $showAlert) {
        } message: {
            Text(errorMessage)
        }
    }
}

//MARK: - Preview
struct HomeDashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDashBoardView()
    }
}

