//
//  CollectionListingView.swift
//  LoopPlace
//
//

import SwiftUI

struct CollectionListingView: View {
    let categoryId : Int
    
    var body: some View {
        Text("\(categoryId)")
    }
}

struct CollectionListingView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListingView(categoryId: 0)
    }
}
