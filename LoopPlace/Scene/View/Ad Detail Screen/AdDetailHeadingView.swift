//
//  AdDetailHeadingView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-28.
//

import SwiftUI

struct AdDetailHeadingView: View {
    //MARK: - Properties
    var title: String
    
    //MARK: - Body
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.medium)
    }
}

//MARK: - Preview
struct AdDetailHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        AdDetailHeadingView(title: "")
    }
}
