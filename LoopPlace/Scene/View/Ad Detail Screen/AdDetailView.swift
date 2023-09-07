//
//  AdDetailView.swift
//  LoopPlace
//
//

import SwiftUI
import MapKit
import Charts

struct AdDetailView: View {
    //MARK: - Properties
    var adDetail: CategoryModel
    
    var mapLocation: Location {
        Location(latitude: Double(adDetail.latitude) ?? 43.651070, longitude: Double(adDetail.longitude) ?? -79.347015)
    }
    
    var averageRating: Double {
        let sumOfRating = adDetail.starRatings.reduce(0, +)
        let averageRating = Double(sumOfRating / adDetail.starRatings.count)
        return averageRating
    }
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                AdDetailsHeaderView(adDetail: adDetail)
                
                // Title and Price
                HStack() {
                    AdDetailHeadingView(title: adDetail.itemName)
                    
                    Spacer()
                    
                    let finalPrice = "Rs. \(adDetail.price)/-"
                    Text(finalPrice)
                        .font(.title3)
                        .fontWeight(.medium)
                } //: HStack
                .padding(.leading, 8)
                .padding(.trailing, 8)
                
                // Description
                Text(adDetail.description)
                    .font(.caption)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                
                // Location
                AdDetailHeadingView(title: "Location")
                    .padding(.leading, 8)
                
                // Map
                InsetMapView(location: mapLocation)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                
                // Rating
                HStack {
                    AdDetailHeadingView(title: "Rating")

                     Spacer()

                    RatingsView(rating: .constant(averageRating), maxRating: 5)
                        .font(.title2)
                }
                .padding(.leading, 8)
                .padding(.trailing, 8)
            }
        } //: ScrollView
    }
}

//MARK: - Preview
struct AdDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var adDetail: CategoryModel!
        AdDetailView(adDetail: adDetail)
    }
}
