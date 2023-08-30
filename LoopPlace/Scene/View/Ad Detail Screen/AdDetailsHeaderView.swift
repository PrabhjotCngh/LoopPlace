//
//  AdDetailsHeaderView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-28.
//

import SwiftUI

struct AdDetailsHeaderView: View {
    //MARK: - Properties
    var adDetail: CategoryModel

    //MARK: - Body
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: adDetail.itemImage)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            } placeholder: {
                ProgressView()
            } //: AsyncImage
        } //: ZStack
        .frame(height: 280)
    }
}

//MARK: - Preview
struct AdDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        var adDetail: CategoryModel!
        AdDetailsHeaderView(adDetail: adDetail)
    }
}
