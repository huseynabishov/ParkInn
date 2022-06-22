//
//  TabBarPage.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.06.2022.
//

import SwiftUI
import UIKit

struct TabBarView: View {
    
    @State var selectedTab = "Home"
    @Binding var pages: [TabBarPage]
    
    init(pages: Binding<[TabBarPage]>) {
        UITabBar.appearance().isHidden = true
        self._pages = pages
    }
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                        .tabItem{
                            EmptyView()
                        }
                        .tag(item.tag)
                }
            }
            
            HStack {
                ForEach(pages) { item in
                    Button(action: {
                            self.selectedTab = item.tag
                        
                    }) {
                        VStack{
                            Image(systemName: self.selectedTab == item.tag ?  item.icon2 : item.icon )
                                .foregroundColor(self.selectedTab == item.tag ?  Color.blue : Color.gray )
                                .font(.system(size: 20))
                                .frame(width: 30)
//                                .imageScale(.large)
                            
                            Text("Home")
//                                Circle()
//                                    .foregroundColor(Color.red)
//                                .frame(width: 6, height: 6)
//                                .animation(Animation.easeOut)
                            
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            
            .padding(20)
            .padding(.bottom, 10)
            .background(Color.white)
            .cornerRadius(20)
            
            
        }
        .ignoresSafeArea()
        
    }
}

struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var icon2: String
    var tag: String
}
