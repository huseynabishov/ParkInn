//
//  MapView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    var body: some View {
        
        Home()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct Home : View {
    
    @State var map = MKMapView()
    @State var manager = CLLocationManager()
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 0){
                
                HStack{
                    
                    Text("Pick a Location")
                        .font(.title)
                    
                    Spacer()
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                MappView(map: self.$map)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MappView : UIViewRepresentable {
    
    @Binding var map : MKMapView
    
    func makeUIView(context: Context) -> MKMapView {
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}
