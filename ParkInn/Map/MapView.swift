//
//  MapView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.06.2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center:
                                                    CLLocationCoordinate2D(latitude: 37.3387, longitude: -121.8853),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    
    var body: some View {
        
        Map(coordinateRegion: $region, showsUserLocation: true)
            .ignoresSafeArea()

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
