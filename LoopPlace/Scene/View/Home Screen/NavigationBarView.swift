//
//  NavigationBarView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-24.
//

import SwiftUI

struct NavigationBarView: View {
    //MARK: - Properties
    @State private var isAnimated: Bool = false

    //MARK: - Body
    var body: some View {
        HStack {
            Spacer()
            
            LogoView()
              .opacity(isAnimated ? 1 : 0)
              .offset(x: 0, y: isAnimated ? 0 : -25)
              .onAppear(perform: {
                withAnimation(.easeOut(duration: 0.5)) {
                  isAnimated = true
                }
              })
            
            Spacer()
        } //: HStack
    }
}

//MARK: - Preview
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
          .previewLayout(.sizeThatFits)
    }
}
