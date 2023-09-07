//
//  RatingsView.swift
//  LoopPlace
//
//

import SwiftUI

struct RatingsView: View {
    //MARK: - Properties
    struct ClipShape: Shape {
        let width: Double
        
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        }
    }
    
    @Binding var star: Double
    let maxRating: Int
    
    init(rating: Binding<Double>, maxRating: Int) {
        self.maxRating = maxRating
        self._star = rating
    }
    
    //MARK: -  Body
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Text(Image(systemName: "star"))
                    .foregroundColor(.gray)
                    .scaledToFill()
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.gray)
                            .scaledToFill()
                    }
                }
                .clipShape(
                    ClipShape(width: (reader.size.width / CGFloat(maxRating)) * CGFloat(star))
                )
            }
        )
    }
}

// MARK: - Preview
struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: .constant(1.6), maxRating: 5)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
