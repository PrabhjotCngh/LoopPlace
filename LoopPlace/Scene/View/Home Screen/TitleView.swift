//
//  TitleView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-24.
//

import SwiftUI

struct TitleView: View {
    //MARK: - Properties
    var title: String
    
    //MARK: - Body
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.black)
            
            Spacer()
        } //: HSTACK
        .padding(.horizontal)
    }
}

//MARK: - Preview
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Hot Deals")
            .previewLayout(.sizeThatFits)
            .background(.white)
    }
}
