//
//  ProductItemView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-24.
//

import SwiftUI

struct ProductItemView: View {
    //MARK: - Properties
    let product: CategoryListingModel
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Photo
            AsyncImage(url: URL(string: product.ImageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 150, alignment: .center)
            
            // Name
            Text(product.CategoryName)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: 300, height: 50, alignment: .center)
                .background(.gray)
        } //: VStack
        .cornerRadius(12)
    }
}

//MARK: - Preview
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        var product: CategoryListingModel!
        ProductItemView(product: product)
    }
}
