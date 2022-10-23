//
//  DetailsView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 2.07.2022.
//

import SwiftUI
import NavigationStack

struct DetailsView: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @State private var showModal = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
