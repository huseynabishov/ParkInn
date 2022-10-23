//
//  SearchScreen.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI
import NavigationStack

struct SearchScreen: View {
    
    @State var searchText: String = ""
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    //    @State var showView: Bool = false
    
    @State private var showModal = false
    
    
    var body: some View {
        VStack(){
            ZStack{
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(
                            searchText.isEmpty ? Color.gray : Color("AccentColor"))
                    
                    
                    TextField("Search...", text: $searchText)
                        .foregroundColor(Color("AccentColor"))
                    Button(action:{ showModal = true }){
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color("AccentColor"))
                    }
                }
                .font(.headline)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AccentColor").opacity(0.1))
                    //                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 0)
                )
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("AccentColor")))
                
                .padding()
                
                FilterView(isShowing: $showModal)
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .statusBar(hidden:true)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
