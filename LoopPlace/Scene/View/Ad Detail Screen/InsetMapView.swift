//
//  InsetMapView.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-28.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: - Properties
    @State private var region = MKCoordinateRegion()
    
    var location: Location
    
    //MARK: - Private Functions
    private func setMapRegion() -> MKCoordinateRegion {
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let mapRegion = MKCoordinateRegion(center: location.mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }
    
    //MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [location]) { item in
            MapMarker(coordinate: item.mapCoordinates)
        }
        .frame(height: 200)
        .cornerRadius(12)
        .onAppear {
            region = setMapRegion()
        } //: Map
    }
}

// MARK: - Preview
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        var location: Location!
        InsetMapView(location: location)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
