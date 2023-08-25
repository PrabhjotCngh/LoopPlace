//
//  LogoView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-24.
//

import SwiftUI

struct LogoView: View {
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 4) {
          Text("Market".uppercased())
            .font(.title3)
            .fontWeight(.black)
            .foregroundColor(.black)
          
          Image("ic_launch")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30, alignment: .center)
          
          Text("Place".uppercased())
            .font(.title3)
            .fontWeight(.black)
            .foregroundColor(.black)
        } //: HSTACK
    }
}

//MARK: - Preview
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
