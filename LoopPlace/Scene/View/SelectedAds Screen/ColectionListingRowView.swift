//
//  ColectionListingRowView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-25.
//

import SwiftUI

struct ColectionListingRowView: View {
    //MARK: - Properties
    var category: CategoryModel
    
    //MARK: - Body
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: category.itemImage)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            } //: AsyncImage
            
            VStack(alignment: .leading, spacing: 5) {
                Text(category.itemName)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(category.uploadedAt)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(category.address)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            } //: VStack
        } //: HStack
    }
}

//MARK: - Preview
struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        var category: CategoryModel!
        ColectionListingRowView(category: category)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
