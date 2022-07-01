//
//  SearchScreen.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI
import NavigationStack

struct SearchScreen: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
//    @State var showView: Bool = false
    
    @State private var showModal = false
    
    var body: some View {
        
        ZStack{
            Button(action:{ showModal = true }){
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size:40,weight:.heavy,design:.rounded))
                    .foregroundColor(.black)
                    .padding(.vertical,20)
                    .padding(.horizontal,40)
            }
            .offset(y:-100)
            
            FilterView(isShowing: $showModal)
        }
        .frame(maxWidth:.infinity,maxHeight:.infinity)
        .statusBar(hidden:true)
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
