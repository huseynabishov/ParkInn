//
//  SearchScreen.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI

struct SearchScreen: View {
    @State var textFieldText: String = ""
    @State var showView: Bool = false
    
    var body: some View {
        VStack(){
            HStack() {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .opacity(0.3)
                        .font(.system(size: 20))
                    
                    TextField("Search", text: self.$textFieldText)
                    
                    Button(action: {
                        showView.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .opacity(0.3)
                            .font(.system(size: 20))
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            
            RoundedRectangle(cornerRadius: 30)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .opacity(showView ? 1.0 : 0.0)
                .animation(.easeInOut)

        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
