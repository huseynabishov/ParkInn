//
//  ContentView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        
        TabView {
            MapDirect()
            BookPay()
            ExtendTime()
        }
        .tabViewStyle(PageTabViewStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
