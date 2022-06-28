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
                                .foregroundColor(self.selectedTab == item.tag ?  Color("AccentColor") : Color.gray )
                                .font(.system(size: 20))
                                .frame(width: 30)

                            Text("Home")
                                .foregroundColor(self.selectedTab == item.tag ?  Color("AccentColor") : Color.gray )
                                
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
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(pages: .constant([
            TabBarPage(page: MainMenu(), icon: "house", icon2: "house.fill", tag: "Home"),
            TabBarPage(page: MainMenu(), icon: "bookmark", icon2: "bookmark.fill", tag: "Bookmark"),
            TabBarPage(page: MainMenu(), icon: "doc.plaintext", icon2: "doc.plaintext.fill", tag: "Doc"),
            TabBarPage(page: MainMenu(), icon: "person.crop.circle", icon2: "person.crop.circle.fill", tag: "Profile"),
        ]))
    }
}



struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var icon2: String
    var tag: String
}
